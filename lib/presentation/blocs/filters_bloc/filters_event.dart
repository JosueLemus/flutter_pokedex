part of 'filters_bloc.dart';

class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class ListUpdated extends FiltersEvent {
  final String newValue;
  final FiltersTypes filterType;
  const ListUpdated({required this.newValue, required this.filterType});
}

class AllFiltersReplaced extends FiltersEvent {
  final List<String> types;
  final List<String> weaknesses;
  final List<String> heights;
  final List<String> weights;

  const AllFiltersReplaced(
      {required this.types,
      required this.weaknesses,
      required this.heights,
      required this.weights});
}

enum FiltersTypes { types, weaknesses, heights, weights }
