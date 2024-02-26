import 'package:pokedex/domain/entities/pokemon.dart';

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
}
