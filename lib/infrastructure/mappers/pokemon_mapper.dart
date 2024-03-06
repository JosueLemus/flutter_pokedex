import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';
import 'package:pokedex/infrastructure/models/api_pokemon.dart';
import 'package:pokedex/infrastructure/models/api_pokemon_details.dart';

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
  static PokemonDetails apiPokemonDetailToEntity(
          ApiPokemonDetails apiPokemon) =>
      PokemonDetails(
          id: apiPokemon.id,
          name: apiPokemon.name,
          baseExperience: apiPokemon.baseExperience,
          height: apiPokemon.height,
          weight: apiPokemon.weight,
          pokemonTypes: apiPokemon.types.map((e) => e.type.name).toList(),
          abilities: apiPokemon.abilities
              .map((e) =>
                  PokemonAbility(name: e.ability.name, isHidden: e.isHidden))
              .toList(),
          stats: apiPokemon.stats
              .map((e) => PokemonStat(name: e.stat.name, value: e.baseStat))
              .toList());
}
