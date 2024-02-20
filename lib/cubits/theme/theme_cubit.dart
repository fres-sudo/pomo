import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState(
        mode: ThemeMode.values.byName(json['mode'] as String),
      );

  @override
  Map<String, dynamic>? toJson(ThemeState state) => {
        'mode': state.mode.name,
      };

  void changeMode(ThemeMode? mode) => emit(
        ThemeState(mode: mode ?? ThemeMode.system),
      );
}
