import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/helpers/debounce_helper.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/blocs/filters_bloc/filters_bloc.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex/presentation/blocs/theme_bloc/theme_cubit.dart';
import 'package:pokedex/presentation/widgets/bottom_sheets/filters_bottom_sheet.dart';
import 'package:pokedex/presentation/widgets/bottom_sheets/generations_bottom_sheet.dart';
import 'package:pokedex/presentation/widgets/bottom_sheets/sort_bottom_sheet.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 700);
    return SliverAppBar(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: IconButton(
              highlightColor: Colors.transparent,
              onPressed: context.read<ThemeCubit>().setCurrentTheme,
              icon: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                size: 26,
              )),
        ),
        actions: [
          _FilterButton(
              asset: 'assets/images/home-filters/Generation.png',
              onTap: () {
                final selectedGeneration =
                    context.read<PokemonListBloc>().state.selectedGeneration;
                showCustomModalBottomSheet(
                    context,
                    GenerationsBottomSheet(
                      selectedGeneration: selectedGeneration,
                      onSelect: (selected) {
                        context.read<PokemonListBloc>().add(
                            SelectedGenerationUpdated(
                                selectedGeneration: selected));
                      },
                    ));
              }),
          _FilterButton(
              asset: 'assets/images/home-filters/Sort.png',
              onTap: () {
                final selectedSort =
                    context.read<PokemonListBloc>().state.selectedSort;
                showCustomModalBottomSheet(
                    context,
                    SortBottomSheet(
                      selectedSort: selectedSort,
                      onSelect: (selected) {
                        context
                            .read<PokemonListBloc>()
                            .add(SelectedSortUpdated(selectedSort: selected));
                      },
                    ));
              }),
          _FilterButton(
              asset: 'assets/images/home-filters/Filter.png',
              onTap: () {
                final blocState = context.read<PokemonListBloc>().state;
                context.read<FiltersBloc>().add(AllFiltersReplaced(
                    types: blocState.types,
                    weaknesses: blocState.weaknesses,
                    heights: blocState.heights,
                    weights: blocState.weights));
                showCustomModalBottomSheet(context, const FiltersBottomSheet());
              }),
          const SizedBox(
            width: 24,
          )
        ],
        pinned: true,
        floating: true,
        expandedHeight: 270,
        flexibleSpace: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Center(
                child: Image.asset(
                  "assets/images/gradient-pokeball.png",
                  height: 250,
                  fit: BoxFit.cover,
                  color: AppColors.pokeballGradient.withOpacity(0.05),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 60, 30, 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
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
                    TextField(
                      onChanged: (value) {
                        debouncer.run(() {
                          context
                              .read<PokemonListBloc>()
                              .add(SearchPokemon(textToSearch: value));
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: "What Pokémon are you looking for?",
                        prefixIcon: Icon(Icons.search_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

void showCustomModalBottomSheet(BuildContext context, Widget child) {
  final size = MediaQuery.of(context).size;
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
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
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: SizedBox(
                height: size.width > size.height ? size.height * 0.9 : null,
                child: SingleChildScrollView(
                  child: child,
                ),
              ),
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
    final color = Theme.of(context).brightness == Brightness.light
        ? AppColors.textBlack
        : AppColors.darkThemeIconColor;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          asset,
          width: 25,
          height: 25,
          color: color,
        ),
      ),
    );
  }
}
