part of 'pokemon_list_bloc.dart';

sealed class PokemonListState extends Equatable {
  const PokemonListState();
  
  @override
  List<Object> get props => [];
}

final class PokemonListInitial extends PokemonListState {}
