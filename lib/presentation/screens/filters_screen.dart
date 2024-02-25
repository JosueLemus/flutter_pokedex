import 'package:flutter/material.dart';
import 'package:pokedex/config/constants/filters_constants.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  List<String> selectedTypes = [];
  List<String> selectedWeaknesses = [];
  void onSelectType(String type) {
    if (selectedTypes.contains(type)) {
      selectedTypes.remove(type);
    } else {
      selectedTypes.add(type);
    }
    setState(() {});
  }

  void onSelectWeaknesses(String weaknesses) {
    if (selectedWeaknesses.contains(weaknesses)) {
      selectedWeaknesses.remove(weaknesses);
    } else {
      selectedWeaknesses.add(weaknesses);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23, right: 23, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filters',
                style: TextStyles.pokemonName,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Use advanced search to explore Pokémon by type, weakness, height and more!',
                style:
                    TextStyles.description.copyWith(color: AppColors.textGrey),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Types',
                style: TextStyles.filterTitle,
              ),
            ],
          ),
        ),
        SelectableItem(
            listOfElements: FiltersContants.pokemonTypes,
            selectedItems: selectedTypes,
            onSelect: onSelectType),
        const Padding(
          padding: EdgeInsets.only(left: 23),
          child: Text(
            'Weaknesses',
            style: TextStyles.filterTitle,
          ),
        ),
        SelectableItem(
            listOfElements: FiltersContants.pokemonTypes,
            selectedItems: selectedWeaknesses,
            onSelect: onSelectWeaknesses),
        const Padding(
          padding: EdgeInsets.only(left: 23),
          child: Text(
            'Weaknesses',
            style: TextStyles.filterTitle,
          ),
        ),
        SelectableItem(
            listOfElements: FiltersContants.pokemonTypes,
            selectedItems: selectedWeaknesses,
            onSelect: onSelectWeaknesses),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}

class SelectableItem extends StatelessWidget {
  final List<FilterType> listOfElements;
  final List<String> selectedItems;
  final Function(String selected) onSelect;
  const SelectableItem(
      {super.key,
      required this.listOfElements,
      required this.selectedItems,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          itemCount: listOfElements.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final isSelected =
                selectedItems.contains(listOfElements[index].type);
            return Padding(
              padding: const EdgeInsets.only(right: 8, bottom: 24, top: 8),
              child: InkWell(
                onTap: () => onSelect(listOfElements[index].type),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      boxShadow: isSelected
                          ? [
                              const BoxShadow(
                                  color: Colors.red,
                                  blurRadius: 15,
                                  spreadRadius: 0,
                                  blurStyle: BlurStyle.inner,
                                  offset: Offset(0, 5))
                            ]
                          : [],
                      borderRadius: BorderRadius.circular(25),
                      color: isSelected ? Colors.red : Colors.transparent),
                  child: Center(
                    child: Image.asset(
                      listOfElements[index].asset,
                      width: 25,
                      height: 25,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
