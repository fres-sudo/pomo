import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../pages/projects/widget/filter_project_widget.dart';

part 'filter_project_state.dart';
part 'filter_project_cubit.freezed.dart';


class FilterProjectCubit extends Cubit<FilterProjectState> {
  FilterProjectCubit() : super( FilterProjectState());

  void updateSortOption(SortOption option) {
    emit(state.copyWith(sortOption: option));
  }

  void toggleSortOrder() {
    emit(state.copyWith(isAscending: !state.isAscending));
  }

  void applyFilter() {
    // This method can be used to trigger the actual filtering process
    // For now, it just re-emits the current state to notify listeners
    emit(state);
  }
}