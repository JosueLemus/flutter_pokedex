import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const SecondaryButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundDefaultInput,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyles.description.copyWith(color: AppColors.textGrey),
          ),
        ),
      ),
    );
  }
}
