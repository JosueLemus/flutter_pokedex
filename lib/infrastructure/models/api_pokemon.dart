class ApiPokemon {
  int id;
  String name;
  List<Pokemontype> pokemontypes;

  ApiPokemon({
    required this.id,
    required this.name,
    required this.pokemontypes,
  });

  factory ApiPokemon.fromJson(Map<String, dynamic> json) => ApiPokemon(
        id: json["id"],
        name: json["name"],
        pokemontypes: List<Pokemontype>.from(json["pokemon_v2_pokemontypes"]
            .map((x) => Pokemontype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pokemon_v2_pokemontypes":
            List<dynamic>.from(pokemontypes.map((x) => x.toJson())),
      };
}

class Pokemontype {
  PokemonV2Type pokemonV2Type;

  Pokemontype({
    required this.pokemonV2Type,
  });

  factory Pokemontype.fromJson(Map<String, dynamic> json) => Pokemontype(
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
