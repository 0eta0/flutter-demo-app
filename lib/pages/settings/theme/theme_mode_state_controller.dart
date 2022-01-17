import 'package:demo_app/pages/settings/theme/theme_mode_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeModeStateControllerProvider = StateNotifierProvider<ThemeModeStateController, ThemeModeState>((_) => ThemeModeStateController(data: ThemeMode.system));

class ThemeModeStateController extends StateNotifier<ThemeModeState> {
  ThemeModeStateController({ required ThemeMode data }) : super(const ThemeModeState()) {
    state = state.copyWith(themeMode: data);
  }
  void update(ThemeMode newMode) {
    state = state.copyWith(themeMode: newMode);
  }
}
