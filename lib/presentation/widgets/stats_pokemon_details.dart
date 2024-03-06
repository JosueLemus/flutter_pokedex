import 'package:flutter/material.dart';
import 'package:pokedex/config/helpers/string_helpers.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/pokemon_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';

class StatsPokemonDetails extends StatelessWidget {
  final PokemonDetails pokemon;
  const StatsPokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = PokemonColors.getTypeColor(pokemon.pokemonTypes[0]);
    int totalStatsValue = pokemon.stats
        .fold(0, (previousValue, stat) => previousValue + stat.value);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Base Stats',
          style: TextStyles.filterTitle.copyWith(color: color),
        ),
        ListView.builder(
            padding: EdgeInsets.only(bottom: 16),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: pokemon.stats.length,
            itemBuilder: (context, index) {
              final stat = pokemon.stats[index];
              var name = StringHelpers.capitalize(stat.name);
              if (stat.name == "special-attack") {
                name = "Sp. Atk";
              }
              if (stat.name == "special-defense") {
                name = "Sp. Def";
              }
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    SizedBox(
                        width: 100,
                        child: Text(
                          name,
                          style: TextStyles.pokemonType,
                        )),
                    Text(
                      stat.value.toString(),
                      style: TextStyles.description
                          .copyWith(color: AppColors.textGrey),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10)),
                        height: 4,
                        width: (MediaQuery.of(context).size.width - 210) *
                            stat.value /
                            100,
                      ),
                    )
                  ],
                ),
              );
            }),
        Row(
          children: [
            Container(
                width: 100,
                child: Text(
                  'Total',
                  style: TextStyles.pokemonType,
                )),
            Text(
              totalStatsValue.toString(),
              style: TextStyles.filterTitle,
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'The ranges shown on the right are for a level 100 Pokémon. Maximum values are based on a beneficial nature, 252 EVs, 31 IVs; minimum values are based on a hindering nature, 0 EVs, 0 IVs.',
          style: TextStyles.pokemonType.copyWith(color: AppColors.textGrey),
        )
      ],
    );
  }
}
