class FilterType {
  final String type;
  final String asset;

  FilterType({required this.type, required this.asset});
}

class FiltersContants {
  static List<FilterType> pokemonTypes = [
    FilterType(type: 'bug', asset: 'assets/images/pokemon-types/bug.png'),
    FilterType(type: 'dark', asset: 'assets/images/pokemon-types/dark.png'),
    FilterType(type: 'dragon', asset: 'assets/images/pokemon-types/dragon.png'),
    FilterType(
        type: 'electric', asset: 'assets/images/pokemon-types/electric.png'),
    FilterType(type: 'fairy', asset: 'assets/images/pokemon-types/fairy.png'),
    FilterType(
        type: 'fighting', asset: 'assets/images/pokemon-types/fighting.png'),
    FilterType(type: 'fire', asset: 'assets/images/pokemon-types/fire.png'),
    FilterType(type: 'flying', asset: 'assets/images/pokemon-types/flying.png'),
    FilterType(type: 'ghost', asset: 'assets/images/pokemon-types/ghost.png'),
    FilterType(type: 'grass', asset: 'assets/images/pokemon-types/grass.png'),
    FilterType(type: 'ground', asset: 'assets/images/pokemon-types/ground.png'),
    FilterType(type: 'ice', asset: 'assets/images/pokemon-types/ice.png'),
    FilterType(type: 'normal', asset: 'assets/images/pokemon-types/normal.png'),
    FilterType(type: 'poison', asset: 'assets/images/pokemon-types/poison.png'),
    FilterType(
        type: 'psychic', asset: 'assets/images/pokemon-types/psychic.png'),
    FilterType(type: 'rock', asset: 'assets/images/pokemon-types/rock.png'),
    FilterType(type: 'steel', asset: 'assets/images/pokemon-types/steel.png'),
    FilterType(type: 'water', asset: 'assets/images/pokemon-types/water.png'),
  ];

  static List<FilterType> pokemonHeights = [
    FilterType(type: 'short', asset: 'assets/images/pokemon-heights/short.png'),
    FilterType(
        type: 'medium', asset: 'assets/images/pokemon-heights/medium.png'),
    FilterType(type: 'tall', asset: 'assets/images/pokemon-heights/tall.png'),
  ];

  static List<FilterType> pokemonWeights = [
    FilterType(type: 'light', asset: 'assets/images/pokemon-weights/light.png'),
    FilterType(
        type: 'normal', asset: 'assets/images/pokemon-weights/normal.png'),
    FilterType(type: 'heavy', asset: 'assets/images/pokemon-weights/heavy.png'),
  ];
}
