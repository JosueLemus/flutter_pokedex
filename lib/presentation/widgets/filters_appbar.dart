import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';

class FiltersAppBar extends StatelessWidget {
  final String title;
  final String description;
  const FiltersAppBar(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, right: 23, top: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.pokemonName,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            description,
            style: TextStyles.description.copyWith(color: AppColors.textGrey),
          ),
        ],
      ),
    );
  }
}
