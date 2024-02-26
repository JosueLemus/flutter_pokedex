// To parse this JSON data, do
//
//     final apiPokemonList = apiPokemonListFromJson(jsonString);

import 'dart:convert';

ApiPokemonList apiPokemonListFromJson(String str) =>
    ApiPokemonList.fromJson(json.decode(str));

String apiPokemonListToJson(ApiPokemonList data) => json.encode(data.toJson());

class ApiPokemonList {
  Data data;

  ApiPokemonList({
    required this.data,
  });

  factory ApiPokemonList.fromJson(Map<String, dynamic> json) => ApiPokemonList(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  List<PokemonV2Pokemon> pokemonV2Pokemon;

  Data({
    required this.pokemonV2Pokemon,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pokemonV2Pokemon: List<PokemonV2Pokemon>.from(json["pokemon_v2_pokemon"]
            .map((x) => PokemonV2Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemon_v2_pokemon":
            List<dynamic>.from(pokemonV2Pokemon.map((x) => x.toJson())),
      };
}

class PokemonV2Pokemon {
  int id;
  String name;
  List<PokemonV2Pokemontype> pokemonV2Pokemontypes;

  PokemonV2Pokemon({
    required this.id,
    required this.name,
    required this.pokemonV2Pokemontypes,
  });

  factory PokemonV2Pokemon.fromJson(Map<String, dynamic> json) =>
      PokemonV2Pokemon(
        id: json["id"],
        name: json["name"],
        pokemonV2Pokemontypes: List<PokemonV2Pokemontype>.from(
            json["pokemon_v2_pokemontypes"]
                .map((x) => PokemonV2Pokemontype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pokemon_v2_pokemontypes":
            List<dynamic>.from(pokemonV2Pokemontypes.map((x) => x.toJson())),
      };
}

class PokemonV2Pokemontype {
  PokemonV2Type pokemonV2Type;

  PokemonV2Pokemontype({
    required this.pokemonV2Type,
  });

  factory PokemonV2Pokemontype.fromJson(Map<String, dynamic> json) =>
      PokemonV2Pokemontype(
        pokemonV2Type: PokemonV2Type.fromJson(json["pokemon_v2_type"]),
      );

  Map<String, dynamic> toJson() => {
        "pokemon_v2_type": pokemonV2Type.toJson(),
      };
}

class PokemonV2Type {
  String name;

  PokemonV2Type({
    required this.name,
  });

  factory PokemonV2Type.fromJson(Map<String, dynamic> json) => PokemonV2Type(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
