import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/utils/text_formatter.dart';
import 'package:gasto_certo/app/common/utils/validator.dart';
import 'package:gasto_certo/app/common/widgets/custom_bottom_sheet.dart';
import 'package:gasto_certo/app/common/widgets/custom_text_form_field.dart';
import 'package:gasto_certo/app/common/widgets/password_text_form.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';
import 'package:gasto_certo/app/features/bottom_bar/home_bottom_bar_page.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_controller.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_state.dart';
import 'package:gasto_certo/app/locator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _controller = getIt.get<SignUpController>();

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
          builder: (context) => HomeBottomBarPage(user: _nameController.text),
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
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Crie sua conta",
                    style: AppTextStyle.mediumText18
                        .copyWith(color: AppColors.darkBlue),
                  ),
                ),
                Center(
                  child: Text(
                    "demora só um minuto",
                    style: AppTextStyle.mediumText18
                        .copyWith(color: AppColors.darkBlue),
                  ),
                ),
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
                        helperText: "A senha deve ter entre 6 e 12 caractéries",
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
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                  child: PrimaryButton(
                    color: AppColors.darkBlue,
                    textButton: 'Cadastrar',
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        _controller.signUp(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já tem uma conta?',
                      style: AppTextStyle.smallText
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
                    )
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
