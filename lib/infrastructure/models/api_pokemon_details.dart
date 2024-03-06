// To parse this JSON data, do
//
//     final pokemonDetails = pokemonDetailsFromJson(jsonString);

import 'dart:convert';

ApiPokemonDetails pokemonDetailsFromJson(String str) =>
    ApiPokemonDetails.fromJson(json.decode(str));

String pokemonDetailsToJson(ApiPokemonDetails data) =>
    json.encode(data.toJson());

class ApiPokemonDetails {
  List<Ability> abilities;
  int baseExperience;
  int height;
  int id;
  String locationAreaEncounters;
  String name;
  Species species;
  List<Stat> stats;
  List<Type> types;
  int weight;

  ApiPokemonDetails({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.locationAreaEncounters,
    required this.name,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory ApiPokemonDetails.fromJson(Map<String, dynamic> json) =>
      ApiPokemonDetails(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        species: Species.fromJson(json["species"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "species": species.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Ability {
  Species ability;
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  int slot;
  Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
