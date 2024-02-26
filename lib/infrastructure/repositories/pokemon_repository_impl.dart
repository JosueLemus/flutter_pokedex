import 'package:pokedex/domain/datasources/pokemon_datasources.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImplementation extends PokemonRepository {
  final PokemonDatasources datasource;

  PokemonRepositoryImplementation({required this.datasource});
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
    return datasource.getPokemonList(offset, textToSearch, minHeight, maxHeight,
        minWeight, maxWeight, type, sortType, generation);
  }
}
