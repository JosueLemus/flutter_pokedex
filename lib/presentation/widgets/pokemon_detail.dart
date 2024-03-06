import 'package:flutter/material.dart';
import 'package:pokedex/config/helpers/number_formatter.dart';
import 'package:pokedex/config/helpers/string_helpers.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/pokemon_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '#${NumberFormatter.formatNumber(pokemon.id)}',
            style: TextStyles.pokemonNumber
                .copyWith(color: AppColors.textNumber.withOpacity(0.6)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Text(
              StringHelpers.capitalize(pokemon.name),
              style: TextStyles.pokemonName.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 25,
            child: ListView.builder(
                itemCount: pokemon.pokemonTypes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final pokemonType = pokemon.pokemonTypes[index];
                  final typeColor = PokemonColors.getTypeColor(pokemonType);
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: typeColor,
                      ),
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
