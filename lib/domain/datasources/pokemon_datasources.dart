import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';

abstract class PokemonDatasources {
  Future<List<Pokemon>> getPokemonList(
    int offset,
    String textToSearch,
    int minHeight,
    int maxHeight,
    int minWeight,
    int maxWeight,
    String type,
    String sortType,
    String generation,
  );

  Future<PokemonDetails> getPokemonDetails(String pokemonId);
}
