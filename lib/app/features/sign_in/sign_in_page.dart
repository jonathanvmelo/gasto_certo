import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/utils/validator.dart';
import 'package:gasto_certo/app/common/widgets/custom_bottom_sheet.dart';
import 'package:gasto_certo/app/common/widgets/custom_text_form_field.dart';
import 'package:gasto_certo/app/common/widgets/password_text_form.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';
import 'package:gasto_certo/app/features/sign_in/sign_in_controller.dart';
import 'package:gasto_certo/app/features/sign_in/sign_in_state.dart';
import 'package:gasto_certo/app/locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formkey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _signInController = getIt.get<SignInController>();
  bool showError = false;
  String errorText = '';

  @override
  void initState() {
    super.initState();
    stateManager();
  }

  login() {
    final valid =
        _formkey.currentState != null && _formkey.currentState!.validate();
    if (valid) {
      _signInController.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } else {
      log('Erro de validação');
    }
  }

  stateManager() async {
    _signInController.addListener(() {
      if (_signInController.state is SignInStateLoading) {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (_signInController is SignInStateProfile) {
        Navigator.of(context).pushReplacementNamed('/selectProfile');
      }
      if (_signInController.state is SignInStateSuccess) {
        Navigator.of(context).pushReplacementNamed('/homeBottomBar');
      }
      if (_signInController.state is SignInStateError) {
        Navigator.of(context).pop();
        final error = _signInController.state as SignInStateError;
        // ignore: use_build_context_synchronously
        customModalBottomSheet(
          context,
          message: error.message,
          buttonText: 'Tente novamente',
        );
        // setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _signInController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 
  String logo = 'Gasto Certo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: ListView(
            children: [
              Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 50),
                  //   child: Center(
                  //     child: Image.asset('assets/images/logo.png',
                  //         width: 222), // child: Text(
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                        child: Text(
                      '${logo}',
                      style: AppTextStyle.mediumText26,
                    )), // child: Text(
                  ),

                  // Center(
                  //   child: Text(
                  //     "Faça seu login!",
                  //     style: AppTextStyle.mediumText18
                  //         .copyWith(color: AppColors.greyDark),
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: CustomTextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          inputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.none,
                          labelText: 'Seu e-mail',
                          validator: Validator.validateEmail,
                        ),
                      ),
                      PasswordTextForm(
                        controller: _passwordController,
                        labelText: 'senha',
                        hintText: '********',
                        //helperText: "A senha deve ter entre 6 e 12 caracteres",
                        validator: Validator.validatePassword,
                        onEditingComplete: () {
                          login();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                        color: AppColors.grey,
                        textButton: 'Entrar',
                        onTap: () {
                          login();
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                        color: AppColors.greylight,
                        textColor: AppColors.greyDark,
                        textButton: 'Cadastre-se',
                        onTap: () {
                          Navigator.of(context).popAndPushNamed('/signUp');
                        }),
                    TextButton(
                      child: Text(
                        "Esqueci minha senha!",
                        style: AppTextStyle.smallText14
                            .copyWith(color: AppColors.greyDark),
                      ),
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed('/forgot');
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.grey.withOpacity(0.2),
                        height: 0.5,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text('ou')),
                    Expanded(
                      child: Divider(
                        color: AppColors.grey.withOpacity(0.2),
                        height: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Ink(
                decoration: BoxDecoration(
                    color: AppColors.grey,
                    border: Border.all(
                      color: AppColors.transparent,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Row(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                                'assets/images/google_circle.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          Text(
                            'Entrar com Google',
                            style: AppTextStyle.mediumText18
                                .apply(color: AppColors.white),
                          )
                        ],
                      ),
                    )),
              ),
              // PrimaryButton(
              //   textButton: 'Entrar com Google',
              //   color: AppColors.googleBlue,
              //   onTap: () {},
              // )
              // GestureDetector(
              //   onTap: () {},
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  validateForm() {
    // Simulando a validação do formulário
    setState(() {
      showError = _formkey.currentState?.validate() == false;
      if (showError) {
        errorText = "A senha deve ter entre 6 e 12 caracteres";
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            showError = false;
            errorText = '';
          });
        });
      }
    });
  }
}
