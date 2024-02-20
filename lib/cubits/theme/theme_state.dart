part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();

  const factory ThemeState({
    @Default(ThemeMode.system) ThemeMode mode,
  }) = _ThemeState;
}
