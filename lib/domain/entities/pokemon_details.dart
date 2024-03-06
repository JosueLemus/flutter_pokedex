class PokemonDetails {
  int id;
  String name;
  int baseExperience;
  int height;
  int weight;
  List<String> pokemonTypes;
  List<PokemonAbility> abilities;
  List<PokemonStat> stats;

  PokemonDetails({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.pokemonTypes,
    required this.abilities,
    required this.stats,
  });
}

class PokemonAbility {
  String name;
  bool isHidden;
  PokemonAbility({
    required this.name,
    required this.isHidden,
  });
}

class PokemonStat {
  String name;
  int value;
  PokemonStat({
    required this.name,
    required this.value,
  });
}
