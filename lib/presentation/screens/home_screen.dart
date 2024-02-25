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
          context.select((PokemonListBloc value) {
            return Column(
              children: [
                Text(value.state.heights.toString()),
                Text(value.state.weights.toString()),
                Text(value.state.weaknesses.toString()),
                Text(value.state.types.toString()),
              ],
            );
          })
        ],
      ),
    );
  }
}
