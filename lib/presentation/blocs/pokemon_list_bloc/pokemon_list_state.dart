part of 'pokemon_list_bloc.dart';

class PokemonListState extends Equatable {
  final String selectedGeneration;
  final String selectedSort;
  final List<String> types;
  final List<String> weaknesses;
  final List<String> heights;
  final List<String> weights;
  final List<Pokemon> pokemonList;
  final int currentPage;
  final String textToSearch;

  const PokemonListState({
    this.selectedGeneration = "",
    this.selectedSort = "Smallest number first",
    this.types = const [],
    this.weaknesses = const [],
    this.heights = const [],
    this.weights = const [],
    this.pokemonList = const [],
    this.currentPage = 0,
    this.textToSearch = "",
  });

  PokemonListState copyWith({
    String? selectedGeneration,
    String? selectedSort,
    List<String>? types,
    List<String>? weaknesses,
    List<String>? heights,
    List<String>? weights,
    List<Pokemon>? pokemonList,
    int? currentPage,
    String? textToSearch,
  }) =>
      PokemonListState(
        selectedGeneration: selectedGeneration ?? this.selectedGeneration,
        selectedSort: selectedSort ?? this.selectedSort,
        types: types ?? this.types,
        weaknesses: weaknesses ?? this.weaknesses,
        heights: heights ?? this.heights,
        weights: weights ?? this.weights,
        pokemonList: pokemonList ?? this.pokemonList,
        currentPage: currentPage ?? this.currentPage,
        textToSearch: textToSearch ?? this.textToSearch,
      );

  @override
  List<Object> get props => [
        selectedGeneration,
        selectedSort,
        types,
        weaknesses,
        heights,
        weights,
        pokemonList,
        textToSearch,
        selectedGeneration
      ];
}

final class PokemonListInitial extends PokemonListState {}
