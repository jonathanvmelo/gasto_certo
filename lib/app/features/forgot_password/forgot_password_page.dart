import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/utils/validator.dart';
import 'package:gasto_certo/app/common/widgets/custom_bottom_sheet.dart';
import 'package:gasto_certo/app/common/widgets/custom_dialog.dart';
import 'package:gasto_certo/app/common/widgets/custom_text_form_field.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';
import 'package:gasto_certo/app/features/home/pages/home_page.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_controller.dart';
import 'package:gasto_certo/app/features/sign_up/sign_up_state.dart';
import 'package:gasto_certo/app/data/mocks/mock_auth_service.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset('assets/images/logo.png', width: 222),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Text(
                      "Digite seu email para recuperar sua senha!",
                      style: AppTextStyle.mediumText18
                          .copyWith(color: AppColors.darkBlue),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  form(),
                  buttons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  form() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CustomTextFormField(
              controller: _nameController,
              keyboardType: TextInputType.emailAddress,
              inputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.none,
              //inputFormatters: [UpperCaseTextInputFormatter()],
              labelText: 'Seu e-mail',
              validator: Validator.validateEmail,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }

  buttons(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 160),
          child: PrimaryButton(
            color: AppColors.darkBlue,
            textButton: 'Recuperar senha',
            onTap: () {
              if (_formkey.currentState!.validate()) {
                exibirAlerta(context);
              }
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PrimaryButton(
          color: AppColors.ligthBlue,
          textColor: AppColors.darkBlue,
          textButton: 'Voltar',
          onTap: () {
            Navigator.of(context).popAndPushNamed('/signIn');
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const SignInPage(),
            // ));
          },
        ),
      ],
    );
  }

  void exibirAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          message: 'Por favor, verifique sua caixa de e-mail.',
          onOkay: () {
            _nameController.text = "";
            Navigator.of(context).pop(); // Fecha o AlertDialog
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
