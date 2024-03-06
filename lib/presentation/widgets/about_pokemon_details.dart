import 'package:flutter/material.dart';
import 'package:pokedex/config/helpers/string_helpers.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/pokemon_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';

class AboutPokemonDetails extends StatelessWidget {
  final PokemonDetails pokemon;
  const AboutPokemonDetails({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final color = PokemonColors.getTypeColor(pokemon.pokemonTypes[0]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${StringHelpers.capitalize(pokemon.name)} can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun's rays, the seed grows progressively larger.",
          style: TextStyles.description,
        ),
        const SizedBox(
          height: 16,
        ),
        Text('Pokédex Data',
            style: TextStyles.filterTitle.copyWith(color: color)),
        const _PokedexData(data: 'Species', value: 'Seed Pokemon'),
        _PokedexData(data: 'Height', value: '${(pokemon.height / 10)}m'),
        _PokedexData(data: 'Weight', value: '${(pokemon.weight / 10)}kg'),
        _PokedexData(
            data: 'Abilities',
            value: StringHelpers.getAbilitiesText(pokemon.abilities)),
      ],
    );
  }
}

class _PokedexData extends StatelessWidget {
  final String data;
  final String value;

  const _PokedexData({super.key, required this.data, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
              width: 100,
              child: Text(
                data,
                style: TextStyles.pokemonType,
              )),
          Text(value,
              style:
                  TextStyles.description.copyWith(color: AppColors.textGrey)),
        ],
      ),
    );
  }
}
