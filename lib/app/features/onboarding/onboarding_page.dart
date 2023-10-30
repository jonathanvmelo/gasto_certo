// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';

import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 80,
          ),
          Expanded(
            child: Image.asset(
              'assets/images/group1.png',
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Gaste com sabedoria',
            style: AppTextStyle.mediumText.copyWith(color: AppColors.darkBlue),
          ),
          Text(
            'e poupe mais',
            style: AppTextStyle.mediumText.copyWith(color: AppColors.darkBlue),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PrimaryButton(
              color: AppColors.darkBlue,
              textButton: 'Vamos lá',
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Já tem uma conta?',
                style: AppTextStyle.smallText.copyWith(color: AppColors.grey),
              ),
              TextButton(
                onPressed: () {
                  log(15);
                },
                child: Text(
                  'Entrar',
                  style: AppTextStyle.smallText.copyWith(
                    color: AppColors.ligthBlue,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
