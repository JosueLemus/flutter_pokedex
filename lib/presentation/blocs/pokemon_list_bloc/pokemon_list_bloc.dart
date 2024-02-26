import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/infrastructure/datasources/pokemon_graphql_datasource.dart';
import 'package:pokedex/infrastructure/repositories/pokemon_repository_impl.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonListEvent, PokemonListState> {
  PokemonListBloc() : super(PokemonListInitial()) {
    on<GetPokemonList>((event, emit) async {
      print("hola :v");
      final repository = PokemonRepositoryImplementation(
          datasource: PokemonGraphQlDatasource());
      final pokemonList = await repository.getPokemonList(
          state.pokemonList.length,
          state.textToSearch,
          1,
          2000,
          1,
          2000,
          "",
          "",
          "");

      emit(state.copyWith(pokemonList: pokemonList));
    });
    add(GetPokemonList(page: 1));

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
