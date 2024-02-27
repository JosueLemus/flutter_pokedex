import 'dart:convert';

import 'package:pokedex/config/helpers/pokemon_generations_helper.dart';
import 'package:pokedex/domain/datasources/pokemon_datasources.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/infrastructure/mappers/pokemon_mapper.dart';
import 'package:pokedex/infrastructure/models/api_pokemon.dart';

class PokemonGraphQlDatasource extends PokemonDatasources {
  final String urlbase = "beta.pokeapi.co";
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
    var url = Uri.https(urlbase, 'graphql/v1beta');
    var queryGeneration = "";
    if (generation.isNotEmpty) {
      Map<String, int> limits = getIDLimitsByGeneration(int.parse(generation));
      queryGeneration =
          'pokemon_species_id: {_gt: ${limits['from']}, _lt: ${limits['to']}}';
    }

    final Map<String, dynamic> requestBody = {
      'query': '''
      query samplePokeAPIquery {
        pokemon_v2_pokemon(
          limit: 10,
          offset: 0,
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
          order_by: {name: asc, id: asc}
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
}
