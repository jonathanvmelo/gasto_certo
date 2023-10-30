import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/utils/text_formatter.dart';
import 'package:gasto_certo/app/common/widgets/custom_bottom_sheet.dart';
import 'package:gasto_certo/app/common/widgets/custom_text_form_field.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';
import 'package:gasto_certo/app/features/home/pages/home_page.dart';
import 'package:gasto_certo/app/features/sign_in/sign_in_page.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_controller.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_state.dart';
import 'package:gasto_certo/app/data/mocks/mock_auth_service.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formkey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _controller = SignUpController(MockAuthService());

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      log(_controller.state.toString());
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
          builder: (context) => const HomePage(),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                      "Nova senha",
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
                        CustomTextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          inputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          inputFormatters: [UpperCaseTextInputFormatter()],
                          labelText: 'Seu e-mail',
                          //validator: Validator.validateName,
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Column(
                  children: [
                    PrimaryButton(
                      color: AppColors.darkBlue,
                      textButton: 'Recuperar senha',
                      onTap: () {
                        // if (_formkey.currentState!.validate()) {
                        //   _controller.login(
                        //     name: _nameController.text,
                        //     email: _emailController.text,
                        //     password: _passwordController.text,
                        //   );
                        // } else {
                        //   log('Erro');
                        // }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                      color: AppColors.ligthBlue,
                      textColor: AppColors.darkBlue,
                      textButton: 'Voltar',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ));
                        // if (_formkey.currentState!.validate()) {
                        //   _controller.login(
                        //     name: _nameController.text,
                        //     email: _emailController.text,
                        //     password: _passwordController.text,
                        //   );

                        // } else {
                        //   log('Erro ao logar');
                        // }
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
