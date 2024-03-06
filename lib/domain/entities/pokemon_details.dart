class Pokemon {
  int id;
  String name;
  int baseExperience;
  int height;
  int weight;
  List<String> pokemonTypes;
  List<Ability> abilities;
  List<Stat> stats;

  Pokemon({
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

class Ability {
  String name;
  bool isHidden;
  Ability({
    required this.name,
    required this.isHidden,
  });
}

class Stat {
  String name;
  int value;
  Stat({
    required this.name,
    required this.value,
  });
}
