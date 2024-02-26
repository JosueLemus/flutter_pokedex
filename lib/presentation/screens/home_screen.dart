import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex/presentation/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppBar(),
          Expanded(
            child: context.select((PokemonListBloc value) {
              final pokemonList = value.state.pokemonList;
              return ListView.builder(
                  itemCount: pokemonList.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonList[index];
                    return ListTile(
                      title: Text(pokemon.name),
                      subtitle: Text(pokemon.pokemonTypes[0]),
                    );
                  });
            }),
          )
        ],
      ),
    );
  }
}
