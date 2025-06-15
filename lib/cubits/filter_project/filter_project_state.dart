part of 'filter_project_cubit.dart';

@freezed
sealed class FilterProjectState with _$FilterProjectState {
  const factory FilterProjectState({
    @Default(SortOption.endDate) SortOption sortOption,
    @Default(true) bool isAscending,
  }) = _FilterProjectState;
}

enum SortOption { endDate, startDate, name, completedTasks }
