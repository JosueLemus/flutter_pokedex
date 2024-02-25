import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersInitial()) {
    on<ListUpdated>((event, emit) {
      final newValue = event.newValue;
      switch (event.filterType) {
        case FiltersTypes.heights:
          final heightsList = state.heights;
          if (heightsList.contains(newValue)) {
            heightsList.remove(newValue);
          } else {
            heightsList.add(newValue);
          }
          emit(state.copyWith(heights: heightsList));
          break;
        case FiltersTypes.weights:
          final weightsList = state.weights;
          if (weightsList.contains(newValue)) {
            weightsList.remove(newValue);
          } else {
            weightsList.add(newValue);
          }
          emit(state.copyWith(weights: weightsList));
          break;
        case FiltersTypes.types:
          final typesList = state.types;
          if (typesList.contains(newValue)) {
            typesList.remove(newValue);
          } else {
            typesList.add(newValue);
          }
          emit(state.copyWith(types: typesList));
          break;
        case FiltersTypes.weaknesses:
          final weaknessesList = state.weaknesses;
          if (weaknessesList.contains(newValue)) {
            weaknessesList.remove(newValue);
          } else {
            weaknessesList.add(newValue);
          }
          emit(state.copyWith(weaknesses: weaknessesList));
          break;
      }
    });
    on<AllFiltersReplaced>((event, emit) {
      emit(FiltersState(
          heights: event.heights,
          weights: event.weights,
          weaknesses: event.weaknesses,
          types: event.types));
    });
  }
}
