part of 'filters_bloc.dart';

class FiltersState extends Equatable {
  final List<String> types;
  final List<String> weaknesses;
  final List<String> heights;
  final List<String> weights;
  const FiltersState({
    this.types = const [],
    this.weaknesses = const [],
    this.heights = const [],
    this.weights = const [],
  });

  FiltersState copyWith({
    List<String>? types,
    List<String>? weaknesses,
    List<String>? heights,
    List<String>? weights,
  }) =>
      FiltersState(
          types: types ?? this.types,
          weaknesses: weaknesses ?? this.weaknesses,
          heights: heights ?? this.heights,
          weights: weights ?? this.weights);

  @override
  List<Object> get props => [types, weaknesses, heights, weights];
}

final class FiltersInitial extends FiltersState {}
