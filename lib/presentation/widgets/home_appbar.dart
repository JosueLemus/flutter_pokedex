import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/blocs/filters_bloc/filters_bloc.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex/presentation/screens/filters_screen.dart';
import 'package:pokedex/presentation/screens/generations_screen.dart';
import 'package:pokedex/presentation/screens/sort_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/gradient-pokeball.png",
          color: const Color(0xFFB5B9C4).withOpacity(0.05),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _FilterButton(
                      asset: 'assets/images/home-filters/Generation.png',
                      onTap: () {
                        final selectedGeneration = context
                            .read<PokemonListBloc>()
                            .state
                            .selectedGeneration;
                        showCustomModalBottomSheet(
                            context,
                            GenerationsScreen(
                              selectedGeneration: selectedGeneration,
                            ));
                      }),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: _FilterButton(
                        asset: 'assets/images/home-filters/Sort.png',
                        onTap: () {
                          final selectedSort = context
                              .read<PokemonListBloc>()
                              .state
                              .selectedSort;
                          showCustomModalBottomSheet(
                              context,
                              SortScreen(
                                selectedSort: selectedSort,
                                onSelect: (selected) {
                                  context.read<PokemonListBloc>().add(
                                      SelectedSortUpdated(
                                          selectedSort: selected));
                                },
                              ));
                        }),
                  ),
                  _FilterButton(
                      asset: 'assets/images/home-filters/Filter.png',
                      onTap: () {
                        final blocState = context.read<PokemonListBloc>().state;
                        context.read<FiltersBloc>().add(AllFiltersReplaced(
                            types: blocState.types,
                            weaknesses: blocState.weaknesses,
                            heights: blocState.heights,
                            weights: blocState.weights));
                        showCustomModalBottomSheet(
                            context, const FiltersScreen());
                      }),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Pokédex',
                style: TextStyles.applicationTitle,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 16),
                child: Text(
                    'Search for Pokémon by name or using the National Pokédex number.'),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "What Pokémon are you looking for?dsad",
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

void showCustomModalBottomSheet(BuildContext context, Widget child) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      context: context,
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 100,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 8),
            Container(
              // height: 1000,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white),
              child: child,
            ),
          ],
        );
      });
}

class _FilterButton extends StatelessWidget {
  final String asset;
  final Function() onTap;
  const _FilterButton({required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          asset,
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
