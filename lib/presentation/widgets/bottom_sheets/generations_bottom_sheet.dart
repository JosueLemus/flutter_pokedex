import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/widgets/filters_appbar.dart';

class GenerationsBottomSheet extends StatelessWidget {
  final String selectedGeneration;
  final Function(String selected) onSelect;
  const GenerationsBottomSheet(
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
                itemCount: 9,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.2),
                itemBuilder: (context, index) {
                  final bool isSelected =
                      selectedGeneration == '${index + 1}' ||
                          (selectedGeneration == '' && index == 8);
                  return InkWell(
                    onTap: () {
                      if (!isSelected) {
                        if (index == 8) {
                          onSelect('');
                        } else {
                          onSelect('${index + 1}');
                        }
                      }
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.backgroundDefaultInput),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 10,
                              right: 0,
                              top: 10,
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/generation-card-bg.png',
                                fit: BoxFit.cover,
                                color: isSelected
                                    ? AppColors.backgroundWhite.withOpacity(0.2)
                                    : AppColors.textGrey.withOpacity(0.05),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (index != 8)
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    child: Image.asset(
                                        'assets/images/pokemon-generations/Generation ${index + 1}.png'),
                                  ),
                                Text(
                                  index == 8
                                      ? 'All'
                                      : 'Generation ${index + 1}',
                                  style: TextStyles.description.copyWith(
                                      color: isSelected
                                          ? AppColors.textWhite
                                          : AppColors.textGrey),
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                }),
          ),
        )
      ],
    );
  }
}
