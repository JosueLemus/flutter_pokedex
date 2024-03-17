import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/config/helpers/string_helpers.dart';
import 'package:pokedex/config/theme/pokemon_colors.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/presentation/widgets/pokemon_detail.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final pokemonCardColor =
        PokemonColors.getBackgroundTypeColor(pokemon.pokemonTypes[0]);
    String imageUrl = StringHelpers.getPokemonImageUrl(pokemon.id);
    return SlideInRight(
      child: Container(
        height: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: pokemonCardColor.withOpacity(0.3),
              offset: const Offset(0, 25),
              blurRadius: 20)
        ]),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: pokemonCardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: PokemonDetail(pokemon: pokemon),
                ),
              ),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/images/background-card.png',
                )),
            Positioned(
                right: 0,
                child: Image.network(
                  imageUrl,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ))
          ],
        ),
      ),
    );
  }
}
