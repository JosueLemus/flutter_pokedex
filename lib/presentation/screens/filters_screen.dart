import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/constants/filters_constants.dart';
import 'package:pokedex/config/theme/pokemon_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/blocs/filters_bloc/filters_bloc.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
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
              },
              getColor: PokemonColors.getTypeColor);
        }),
        context.select((FiltersBloc value) {
          return SelectableItem(
            title: 'Weaknesses',
            listOfElements: FiltersContants.pokemonTypes,
            selectedItems: value.state.weaknesses,
            onSelect: (value) {
              return context.read<FiltersBloc>().add(ListUpdated(
                  newValue: value, filterType: FiltersTypes.weaknesses));
            },
            getColor: PokemonColors.getTypeColor,
          );
        }),
        context.select((FiltersBloc value) {
          return SelectableItem(
            title: 'Heights',
            listOfElements: FiltersContants.pokemonHeights,
            selectedItems: value.state.heights,
            onSelect: (value) {
              return context.read<FiltersBloc>().add(ListUpdated(
                  newValue: value, filterType: FiltersTypes.heights));
            },
            getColor: PokemonColors.getHeightColor,
          );
        }),
        context.select((FiltersBloc value) {
          return SelectableItem(
            title: 'Weights',
            listOfElements: FiltersContants.pokemonWeights,
            selectedItems: value.state.weights,
            onSelect: (value) {
              return context.read<FiltersBloc>().add(ListUpdated(
                  newValue: value, filterType: FiltersTypes.weights));
            },
            getColor: PokemonColors.getWeightColor,
          );
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 16),
          child: Row(
            children: [
              Expanded(child: SecondaryButton(title: 'Reset', onTap: () {})),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: PrimaryButton(
                      title: 'Apply',
                      onTap: () {
                        final filtersBlocState =
                            context.read<FiltersBloc>().state;
                        context.read<PokemonListBloc>().add(FiltersApplied(
                            types: filtersBlocState.types,
                            weaknesses: filtersBlocState.weaknesses,
                            heights: filtersBlocState.heights,
                            weights: filtersBlocState.weights));
                        Navigator.of(context).pop();
                      }))
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
  final Color Function(String type) getColor;
  const SelectableItem(
      {super.key,
      required this.listOfElements,
      required this.selectedItems,
      required this.onSelect,
      required this.title,
      required this.getColor});

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
                final selectedColor = getColor(listOfElements[index].type);
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
                                  BoxShadow(
                                      color: selectedColor,
                                      blurRadius: 15,
                                      spreadRadius: 0,
                                      blurStyle: BlurStyle.inner,
                                      offset: const Offset(0, 5))
                                ]
                              : [],
                          borderRadius: BorderRadius.circular(25),
                          color:
                              isSelected ? selectedColor : Colors.transparent),
                      child: Center(
                        child: Image.asset(
                          listOfElements[index].asset,
                          width: 25,
                          height: 25,
                          color: isSelected ? Colors.white : selectedColor,
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
