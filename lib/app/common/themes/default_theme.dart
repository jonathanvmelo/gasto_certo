import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';

final defaultTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle:
          AppTextStyle.smallText14.copyWith(color: AppColors.darkBlue)),
  inputDecorationTheme: const InputDecorationTheme(
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  ),
);
