import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/widgets/filters_appbar.dart';

class GenerationsScreen extends StatelessWidget {
  final String selectedGeneration;
  final Function(String selected) onSelect;
  const GenerationsScreen(
      {super.key, required this.selectedGeneration, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FiltersAppBar(
            title: "Generations",
            description: "Use search for generations to explore your Pokémon!"),
        SizedBox(
          height: 600,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: GridView.builder(
                itemCount: 8,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.5),
                itemBuilder: (context, index) {
                  final bool isSelected = selectedGeneration == '${index + 1}';
                  return InkWell(
                    onTap: () {
                      if (!isSelected) {
                        onSelect('${index + 1}');
                      }
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.backgroundDefaultInput),
                        height: 10,
                        child: Center(
                          child: Text(
                            'Generation ${index + 1}',
                            style: TextStyles.description.copyWith(
                                color: isSelected
                                    ? AppColors.textWhite
                                    : AppColors.textGrey),
                          ),
                        )),
                  );
                }),
          ),
        )
      ],
    );
  }
}
