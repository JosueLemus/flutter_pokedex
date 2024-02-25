import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/datasources/entities/pokemon.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(PokemonListInitial()) {
    on<GetPokemonList>((event, emit) {
      // TODO: get pokemon list from api
    });

    on<SearchPokemon>((event, emit) {
      print(event.textToSearch);
    });

    on<SelectedGenerationUpdated>((event, emit) {
      emit(state.copyWith(selectedGeneration: event.selectedGeneration));
    });
    on<SelectedSortUpdated>((event, emit) {
      emit(state.copyWith(selectedSort: event.selectedSort));
    });
    on<FiltersApplied>((event, emit) {
      emit(state.copyWith(
        types: event.types,
        weaknesses: event.weaknesses,
        heights: event.heights,
        weights: event.weights,
      ));
    });
  }
}
