import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/constants/routes.dart';
import 'package:gasto_certo/app/common/utils/text_formatter.dart';
import 'package:gasto_certo/app/common/utils/validator.dart';
import 'package:gasto_certo/app/common/widgets/custom_bottom_sheet.dart';
import 'package:gasto_certo/app/common/widgets/custom_text_form_field.dart';
import 'package:gasto_certo/app/common/widgets/password_text_form.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';
import 'package:gasto_certo/app/features/home_bottom_bar/custom_page_view_page.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_controller.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_state.dart';
import 'package:gasto_certo/app/locator.dart';
import 'package:gasto_certo/app/services/google_auth_service.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  User? user;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _controller = getIt.get<SignUpController>();
  bool success = false;

  GoogleAuthService _googleAuthService = GoogleAuthService();

  Future<User?> signInGoogle() async {
    var response = await _googleAuthService.signInWithGoogle();
    if (response != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, NamedRoute.customBottom);
    } else {
      log('Falha ao logar');
      // ignore: use_build_context_synchronously
      return showDialog(
        context: context,
        builder: (context) => const Center(
          child: Text('Erro ao logar'),
        ),
      );
    }
    return null;
  }

  stateManager() {
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (_controller.state is SignUpSuccessState) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CustomPageViewPage(user: widget.user),
        ));
      }
      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
        customModalBottomSheet(
          context,
          message: error.message,
          buttonText: 'Tentar novamente',
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    stateManager();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: [
                // const SizedBox(
                //   height: 50,
                // ),
                // Center(
                //   child: Text(
                //     "Crie sua conta",
                //     style: AppTextStyle.mediumText18
                //         .copyWith(color: AppColors.darkBlue),
                //   ),
                // ),
                // Center(
                //   child: Text(
                //     "demora só um minuto",
                //     style: AppTextStyle.mediumText18
                //         .copyWith(color: AppColors.darkBlue),
                //   ),
                // ),
                const SizedBox(
                  height: 24,
                ),
                const SizedBox(
                  height: 24,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        inputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        inputFormatters: [UpperCaseTextInputFormatter()],
                        labelText: 'nome',
                        validator: Validator.validateName,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        textCapitalization: TextCapitalization.none,
                        keyboardType: TextInputType.emailAddress,
                        helperText: 'Digite um email válido',
                        labelText: 'email',
                        inputAction: TextInputAction.next,
                        validator: Validator.validateEmail,
                      ),
                      PasswordTextForm(
                        controller: _passwordController,
                        labelText: 'crie sua senha',
                        hintText: '********',
                        helperText: "A senha deve ter entre 6 e 12 caracteres",
                        validator: Validator.validatePassword,
                      ),
                      PasswordTextForm(
                        labelText: 'confirme sua senha',
                        hintText: '********',
                        validator: (value) => Validator.validatePasswordCompare(
                            _passwordController.text),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: PrimaryButton(
                    color: AppColors.darkBlue,
                    textButton: 'Cadastrar',
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        _controller.doSignUp(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      } else {
                        log('Erro ao logar');
                      }
                    },
                  ),
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: AppTextStyle.smallText14.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w300),
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Ao criar uma conta voce concorda com nossos',
                        ),
                        TextSpan(
                          recognizer: TapAndPanGestureRecognizer()
                            ..onTapDown = (details) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Teste')));
                            },
                          text: ' Termos de uso',
                          style: const TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.w800),
                        ),
                        const TextSpan(
                          text: ' e',
                        ),
                        TextSpan(
                          recognizer: TapAndPanGestureRecognizer()
                            ..onTapDown = (details) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Teste')));
                            },
                          text: ' Politica de Privacidade',
                          style: const TextStyle(
                            color: AppColors.darkBlue,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                const Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.darkBlue,
                        height: 5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('ou'),
                    ),
                    Expanded(
                      child: Divider(
                        height: 5,
                        color: AppColors.darkBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    //signInWithGoogle();
                    signInGoogle();
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: AppColors.white,
                        border: Border.all(color: AppColors.googleBlue)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 25,
                        children: [
                          Image.asset('assets/images/google_circle.png',
                              height: 35),
                          Text(
                            'Continuar com Google',
                            style: AppTextStyle.smallText16
                                .copyWith(color: AppColors.googleBlue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: [
                //     ClipRRect(
                //       borderRadius: BorderRadius.circular(25),
                //       child: Container(
                //           alignment: Alignment.center,
                //           height: 50,
                //           width: 50,
                //           decoration: BoxDecoration(
                //               color: AppColors.transparent,
                //               border: Border.all(
                //                   width: 2, color: AppColors.darkBlue)),
                //           child: const Text('G')),
                //     )
                //   ],
                // ),
                // Row(
                //   children: [
                //     const Expanded(
                //         child: Text(
                //       'Ao criar uma conta voce concorda com nossos',
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //     )),
                //     TextButton(
                //         onPressed: () {}, child: const Text('termos de uso')),
                //     const Text('e'),
                //     TextButton(
                //         onPressed: () {},
                //         child: const Text('politica de privacidade'))
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já tem uma conta?',
                      style: AppTextStyle.smallText14
                          .copyWith(color: AppColors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        //customModalBottomSheet(context);
                        Navigator.of(context).popAndPushNamed('/signIn');
                      },
                      child: Text(
                        'Entrar',
                        style: AppTextStyle.mediumText18.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
