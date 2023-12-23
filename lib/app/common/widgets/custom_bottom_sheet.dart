import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';
import 'package:gasto_certo/app/common/widgets/primary_button.dart';

import '../constants/app_colors.dart';

Future<void> customModalBottomSheet(
  BuildContext context, {
  String? message,
  String? buttonText,
  bool isDismissible = true,
  List<Widget>? actions,
  VoidCallback? onPressed,
}) {
  return showModalBottomSheet<void>(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return PopScope(
        onPopInvoked: (didPop) => Future.value(isDismissible),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(38.0),
              topRight: Radius.circular(38.0),
            ),
          ),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Text(
                  message!,
                  style: AppTextStyle.mediumText20.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32.0,
                ),
                child: actions != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: actions,
                      )
                    : PrimaryButton(
                        textColor: AppColors.darkBlue,
                        color: AppColors.darkBlue,
                        textButton: buttonText!,
                        onTap: onPressed ?? () => Navigator.pop(context),
                      ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
