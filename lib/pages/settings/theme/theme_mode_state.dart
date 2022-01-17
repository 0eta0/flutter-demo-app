import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "theme_mode_state.freezed.dart";

@freezed
abstract class ThemeModeState with _$ThemeModeState {
  const factory ThemeModeState({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _ThemeModeState;
}
