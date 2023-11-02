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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset('assets/images/logo.png',
                        width: 222), // child: Text(
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      "Faça seu login!",
                      style: AppTextStyle.mediumText18
                          .copyWith(color: AppColors.darkBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
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
                          helperText:
                              "A senha deve ter entre 6 e 12 caracteres",
                          validator: Validator.validatePassword,
                          onEditingComplete: () {
                            login();
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        PrimaryButton(
                            color: AppColors.darkBlue,
                            textButton: 'Entrar',
                            onTap: () {
                              login();
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        PrimaryButton(
                            color: AppColors.ligthBlue,
                            textColor: AppColors.darkBlue,
                            textButton: 'Cadastre-se',
                            onTap: () {
                              Navigator.of(context).popAndPushNamed('/signUp');
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          child: Text(
                            "Esqueci minha senha!",
                            style: AppTextStyle.mediumText18
                                .copyWith(color: AppColors.darkBlue),
                          ),
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed('/forgot');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
