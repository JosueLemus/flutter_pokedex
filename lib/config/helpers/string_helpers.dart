import 'package:pokedex/config/helpers/number_formatter.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';

class StringHelpers {
  static String getPokemonImageUrl(int pokemonId) {
    String formattedId = NumberFormatter.formatNumber(pokemonId);
    return 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/$formattedId.png';
  }

  static String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  static String getAbilitiesText(List<PokemonAbility> abilities) {
    return abilities.map((ability) {
      String abilityName = StringHelpers.capitalize(ability.name);
      if (ability.isHidden) {
        abilityName += ' (hidden ability)';
      }
      return abilityName;
    }).join('\n');
  }
}
