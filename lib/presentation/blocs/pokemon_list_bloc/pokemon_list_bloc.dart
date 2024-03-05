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
      if (state.isLoading) return;
      emit(state.copyWith(isLoading: true));
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
          state.selectedSort,
          state.selectedGeneration);

      emit(state.copyWith(
          pokemonList: [...state.pokemonList, ...pokemonList],
          isLoading: false));
    });
    add(GetPokemonList());

    on<ReloadData>((event, emit) async {
      if (state.isLoading) return;
      emit(state.copyWith(isLoading: true));
      final repository = PokemonRepositoryImplementation(
          datasource: PokemonGraphQlDatasource());
      final pokemonList = await repository.getPokemonList(0, state.textToSearch,
          1, 2000, 1, 2000, "", state.selectedSort, state.selectedGeneration);

      emit(state.copyWith(pokemonList: pokemonList, isLoading: false));
    });

    on<SearchPokemon>((event, emit) async {
      emit(state.copyWith(textToSearch: event.textToSearch));
      add(ReloadData());
    });

    on<SelectedGenerationUpdated>((event, emit) {
      emit(state.copyWith(selectedGeneration: event.selectedGeneration));
      add(ReloadData());
    });
    on<SelectedSortUpdated>((event, emit) {
      emit(state.copyWith(selectedSort: event.selectedSort));
      add(ReloadData());
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
