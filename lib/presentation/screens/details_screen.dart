import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String pokemonId;
  const DetailsScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(pokemonId),
        ),
      ),
    );
  }
}
