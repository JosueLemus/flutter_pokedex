import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/constants/filters_constants.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/blocs/filters_bloc/filters_bloc.dart';
import 'package:pokedex/presentation/widgets/filters_appbar.dart';
import 'package:pokedex/presentation/widgets/primary_button.dart';
import 'package:pokedex/presentation/widgets/secondary_button.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FiltersAppBar(
            title: 'Filters',
            description:
                'Use advanced search to explore Pokémon by type, weakness, height and more!'),
        context.select((FiltersBloc value) {
          return SelectableItem(
              title: 'Types',
              listOfElements: FiltersContants.pokemonTypes,
              selectedItems: value.state.types,
              onSelect: (value) {
                return context.read<FiltersBloc>().add(ListUpdated(
                    newValue: value, filterType: FiltersTypes.types));
              });
        }),
        context.select((FiltersBloc value) {
          return SelectableItem(
              title: 'Weaknesses',
              listOfElements: FiltersContants.pokemonTypes,
              selectedItems: value.state.weaknesses,
              onSelect: (value) {
                return context.read<FiltersBloc>().add(ListUpdated(
                    newValue: value, filterType: FiltersTypes.weaknesses));
              });
        }),
        context.select((FiltersBloc value) {
          return SelectableItem(
              title: 'Heights',
              listOfElements: FiltersContants.pokemonHeights,
              selectedItems: value.state.heights,
              onSelect: (value) {
                return context.read<FiltersBloc>().add(ListUpdated(
                    newValue: value, filterType: FiltersTypes.heights));
              });
        }),
        context.select((FiltersBloc value) {
          return SelectableItem(
              title: 'Weights',
              listOfElements: FiltersContants.pokemonWeights,
              selectedItems: value.state.weights,
              onSelect: (value) {
                return context.read<FiltersBloc>().add(ListUpdated(
                    newValue: value, filterType: FiltersTypes.weights));
              });
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
          child: Row(
            children: [
              Expanded(child: SecondaryButton(title: 'Reset', onTap: () {})),
              const SizedBox(
                width: 16,
              ),
              Expanded(child: PrimaryButton(title: 'Apply', onTap: () {}))
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}

class SelectableItem extends StatelessWidget {
  final String title;
  final List<FilterType> listOfElements;
  final List<String> selectedItems;
  final Function(String selected) onSelect;
  const SelectableItem(
      {super.key,
      required this.listOfElements,
      required this.selectedItems,
      required this.onSelect,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23),
          child: Text(
            title,
            style: TextStyles.filterTitle,
          ),
        ),
        SizedBox(
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
        ),
      ],
    );
  }
}
