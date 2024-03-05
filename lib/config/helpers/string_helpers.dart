import 'package:pokedex/config/helpers/number_formatter.dart';

class StringHelpers {
  static String getPokemonImageUrl(int pokemonId) {
    String formattedId = NumberFormatter.formatNumber(pokemonId);
    return 'https://assets.pokemon.com/assets/cms2/img/pokedex/detail/$formattedId.png';
  }
}
