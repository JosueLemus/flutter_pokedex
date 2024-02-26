import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/infrastructure/models/api_pokemon.dart';

class PokemonMapper {
  static List<Pokemon> apiPokemonToEntity(List<PokemonV2Pokemon> apiPokemon) =>
      apiPokemon
          .map((e) => Pokemon(
              id: e.id,
              name: e.name,
              pokemonTypes: e.pokemonV2Pokemontypes
                  .map((e) => e.pokemonV2Type.name)
                  .toList()))
          .toList();
}
