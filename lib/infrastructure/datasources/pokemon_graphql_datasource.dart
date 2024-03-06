import 'dart:convert';

import 'package:pokedex/config/helpers/pokemon_generations_helper.dart';
import 'package:pokedex/domain/datasources/pokemon_datasources.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/domain/entities/pokemon_details.dart';
import 'package:pokedex/infrastructure/mappers/pokemon_mapper.dart';
import 'package:pokedex/infrastructure/models/api_pokemon.dart';
import 'package:pokedex/infrastructure/models/api_pokemon_details.dart';

class PokemonGraphQlDatasource extends PokemonDatasources {
  final String urlbaseGraphQL = "beta.pokeapi.co";
  final String urlbasePokedex = "pokeapi.co";
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
      String generation) async {
    var url = Uri.https(urlbaseGraphQL, 'graphql/v1beta');
    var queryGeneration = "";
    if (generation.isNotEmpty) {
      Map<String, int> limits = getIDLimitsByGeneration(int.parse(generation));
      queryGeneration =
          'pokemon_species_id: {_gt: ${limits['from']}, _lt: ${limits['to']}}';
    }

    var querySort = "";
    switch (sortType) {
      case "Smallest number first":
        querySort = 'order_by: {id: asc}';
        break;
      case "Highest number first":
        querySort = 'order_by: {id: desc}';
      case "A-Z":
        querySort = "order_by: {name: asc}";
        break;
      case "Z-A":
        querySort = "order_by: {name: desc}";
        break;
      default:
        querySort = 'order_by: {id: asc}';
    }

    final Map<String, dynamic> requestBody = {
      'query': '''
      query samplePokeAPIquery {
        pokemon_v2_pokemon(
          limit: 10,
          offset: $offset,
          where: {
            height: {_lt: 2000, _gt: 1},
            weight: {_lt: 2000, _gt: 1},
            pokemon_v2_pokemontypes: {
              pokemon_v2_type: {
                name: {_regex: ""}
              }
            },
            id: {_gt: 0, _lt: 1000},
            name: {_regex: "$textToSearch"},
            $queryGeneration
          },
          $querySort
        ) {
          id
          name
          pokemon_v2_pokemontypes(limit: 3) {
            pokemon_v2_type {
              name
            }
          }
        }
      }
    '''
    };

    var response = await http.post(url, body: jsonEncode(requestBody));
    final pokemonList =
        apiPokemonListFromJson(response.body).data.pokemonV2Pokemon;

    return PokemonMapper.apiPokemonToEntity(pokemonList);
  }

  @override
  Future<PokemonDetails> getPokemonDetails(String pokemonId) async {
    var url = Uri.https(urlbasePokedex, 'api/v2/pokemon/$pokemonId');
    var response = await http.get(url);
    final pokemon = pokemonDetailsFromJson(response.body);
    final localPokemon = PokemonMapper.apiPokemonDetailToEntity(pokemon);
    return localPokemon;
  }
}
