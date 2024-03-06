part of 'pokemon_details_bloc.dart';

class PokemonDetailsState extends Equatable {
  final PokemonDetails? pokemon;
  final bool isLoading;
  const PokemonDetailsState({this.pokemon, this.isLoading = false});

  @override
  List<Object> get props => [isLoading];

  PokemonDetailsState copyWith({
    PokemonDetails? pokemon,
    bool? isLoading,
  }) =>
      PokemonDetailsState(
          isLoading: isLoading ?? this.isLoading,
          pokemon: pokemon ?? this.pokemon);
}

final class PokemonDetailsInitial extends PokemonDetailsState {}
