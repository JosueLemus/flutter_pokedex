part of 'pokemon_list_bloc.dart';

sealed class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonList extends PokemonListEvent {}

class SelectedGenerationUpdated extends PokemonListEvent {
  final String selectedGeneration;
  const SelectedGenerationUpdated({required this.selectedGeneration});
}

class SelectedSortUpdated extends PokemonListEvent {
  final String selectedSort;
  const SelectedSortUpdated({required this.selectedSort});
}

class SearchPokemon extends PokemonListEvent {
  final String textToSearch;
  const SearchPokemon({required this.textToSearch});
}

class FiltersApplied extends PokemonListEvent {
  final List<String> types;
  final List<String> weaknesses;
  final List<String> heights;
  final List<String> weights;

  const FiltersApplied(
      {required this.types,
      required this.weaknesses,
      required this.heights,
      required this.weights});
}
