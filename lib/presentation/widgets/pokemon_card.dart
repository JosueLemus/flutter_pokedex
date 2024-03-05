import 'package:flutter/material.dart';
import 'package:pokedex/config/helpers/number_formatter.dart';
import 'package:pokedex/config/helpers/string_helpers.dart';
import 'package:pokedex/config/theme/pokemon_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final pokemonCardColor =
        PokemonColors.getBackgroundTypeColor(pokemon.pokemonTypes[0]);
    String imageUrl = StringHelpers.getPokemonImageUrl(pokemon.id);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Container(
        height: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: pokemonCardColor.withOpacity(0.2),
              offset: const Offset(0, 40),
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

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('#${NumberFormatter.formatNumber(pokemon.id)}'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(pokemon.name),
          ),
          SizedBox(
            height: 25,
            child: ListView.builder(
                itemCount: pokemon.pokemonTypes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final pokemonType = pokemon.pokemonTypes[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      color: Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/pokemon-types/$pokemonType.png',
                              width: 15,
                              height: 15,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              StringHelpers.capitalize(pokemonType),
                              style: TextStyles.pokemonType
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ]);
  }
}
