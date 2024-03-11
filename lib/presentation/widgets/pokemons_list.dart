import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex/presentation/widgets/pokemon_card.dart';

class PokemonsList extends StatelessWidget {
  const PokemonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonListBloc, PokemonListState>(
      buildWhen: (previous, current) {
        return (previous.pokemonList != current.pokemonList) ||
            current.isLoading;
      },
      builder: (context, state) {
        final pokemonList = state.pokemonList;
        return SliverGrid.builder(
            itemCount:
                state.isLoading ? pokemonList.length + 1 : pokemonList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 150,
              maxCrossAxisExtent: 600,
              mainAxisSpacing: 20,
              crossAxisSpacing: 0,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              if (state.isLoading && index == pokemonList.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final pokemon = pokemonList[index];
              return GestureDetector(
                  onTap: () {
                    context.pushNamed('details',
                        pathParameters: {'pokemonid': pokemon.id.toString()});
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: PokemonCard(pokemon: pokemon),
                  ));
            });
      },
    );
  }
}
