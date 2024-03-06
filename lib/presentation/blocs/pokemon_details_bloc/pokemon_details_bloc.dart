import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';
import 'package:pokedex/infrastructure/datasources/pokemon_graphql_datasource.dart';
import 'package:pokedex/infrastructure/repositories/pokemon_repository_impl.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  final String pokemonId;
  PokemonDetailsBloc(this.pokemonId) : super(PokemonDetailsInitial()) {
    on<GetPokemonDetails>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final repository = PokemonRepositoryImplementation(
          datasource: PokemonGraphQlDatasource());
      final pokemon = await repository.getPokemonDetails(pokemonId);
      emit(state.copyWith(pokemon: pokemon, isLoading: false));
    });
    add(GetPokemonDetails());
  }
}
