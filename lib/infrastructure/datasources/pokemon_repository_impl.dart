import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplementation extends PokemonRepository {
  @override
  Future<List<Pokemon>> getPokemonList(
      int offset,
      String textToSearch,
      int minHeight,
      int maxHeight,
      int minWeight,
      int maxWeight,
      String type,
      String sortType,
      String generation) {
    // TODO: implement getPokemonList
    throw UnimplementedError();
  }
}
