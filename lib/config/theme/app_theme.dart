import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';

class AppTheme {
  ThemeData getTheme(bool isDarkMode) {
    return ThemeData(
        appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.transparent,
            foregroundColor: !isDarkMode
                ? AppColors.textBlack
                : AppColors.darkThemeIconColor),
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        primaryColor: AppColors.primary,
        hintColor: AppColors.textGrey,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.primary),
        tabBarTheme: const TabBarTheme(
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyles.description,
          fillColor: isDarkMode
              ? AppColors.pokeballGradient.withOpacity(0.1)
              : AppColors.backgroundDefaultInput,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        sliderTheme: const SliderThemeData(
          activeTrackColor: AppColors.primary,
          thumbColor: AppColors.primary,
        ));
  }
}
