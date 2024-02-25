import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersInitial()) {
    on<ListUpdated>((event, emit) {
      final List<String> listOfStrings = [];
      final newValue = event.newValue;
      switch (event.filterType) {
        case FiltersTypes.heights:
          listOfStrings.addAll(state.heights);
          if (listOfStrings.contains(newValue)) {
            listOfStrings.remove(newValue);
          } else {
            listOfStrings.add(newValue);
          }
          emit(state.copyWith(heights: listOfStrings));
          break;
        case FiltersTypes.weights:
          listOfStrings.addAll(state.weights);
          if (listOfStrings.contains(newValue)) {
            listOfStrings.remove(newValue);
          } else {
            listOfStrings.add(newValue);
          }
          emit(state.copyWith(weights: listOfStrings));
          break;
        case FiltersTypes.types:
          listOfStrings.addAll(state.types);
          if (listOfStrings.contains(newValue)) {
            listOfStrings.remove(newValue);
          } else {
            listOfStrings.add(newValue);
          }
          emit(state.copyWith(types: listOfStrings));
          break;
        case FiltersTypes.weaknesses:
          listOfStrings.addAll(state.weaknesses);
          if (listOfStrings.contains(newValue)) {
            listOfStrings.remove(newValue);
          } else {
            listOfStrings.add(newValue);
          }
          emit(state.copyWith(weaknesses: listOfStrings));
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
