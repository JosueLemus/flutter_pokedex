import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
        primaryColor: AppColors.primary,
        hintColor: AppColors.textGrey,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.primary),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyles.description,
          fillColor: AppColors.backgroundDefaultInput,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ));
  }
}
