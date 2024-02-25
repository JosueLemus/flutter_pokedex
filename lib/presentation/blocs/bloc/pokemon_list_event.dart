part of 'pokemon_list_bloc.dart';

sealed class PokemonListEvent extends Equatable {
  const PokemonListEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonList extends PokemonListEvent {
  final int page;
  const GetPokemonList({required this.page});
}

class SelectedGenerationUpdated extends PokemonListEvent {
  final String selectedGeneration;
  const SelectedGenerationUpdated({required this.selectedGeneration});
}

class SelectedSortUpdated extends PokemonListEvent {
  final String selectedSort;
  const SelectedSortUpdated({required this.selectedSort});
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
