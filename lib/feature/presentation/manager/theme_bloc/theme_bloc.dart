import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:home_chef/core/core.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this.themeMode)
      : super(
    ThemeState(
      isLightTheme: themeMode,
      colorSeed: ColorSeed.baseColor, // Начальный цвет
    ),
  ) {
    on<ToggleThemeEvent>(_onToggleTheme);
    on<ChangeColorSeedEvent>(_onChangeColorSeed);
  }

  final bool themeMode;

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(isLightTheme: event.isLightTheme));
  }

  void _onChangeColorSeed(ChangeColorSeedEvent event, Emitter<ThemeState> emit) {
    emit(state.copyWith(colorSeed: event.colorSeed));
  }
}



