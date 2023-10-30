// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String textButton;
  final Color color;
  final Color? textColor;
  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(15));
  const PrimaryButton({
    Key? key,
    this.onTap,
    required this.textButton,
    required this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 64,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: AppColors.grey,
              blurRadius: 5,
              blurStyle: BlurStyle.normal,
              spreadRadius: -3,
              offset: Offset(0, 5)),
        ],
        borderRadius: _borderRadius,
        color: color,
        // gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: onTap != null
        //         ? AppColors.gradientGreen
        //         : AppColors.gradientGrey),
      ),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onTap,
        child: Align(
          child: Text(
            textButton,
            style: AppTextStyle.mediumText18
                .copyWith(color: textColor ?? AppColors.white),
          ),
        ),
      ),
    );
  }
}
