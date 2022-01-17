import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state.dart';
import 'package:demo_app/pages/settings/theme/theme_mode_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeModeStateControllerProvider = StateNotifierProvider.autoDispose<ThemeModeStateController, PokemonListState>((ref) => throw UnimplementedError());
final themeModeStateControllerProviderFamily = StateNotifierProvider.autoDispose.family<ThemeModeStateController, ThemeModeState, ThemeMode>((ref, data) => ThemeModeStateController(data: data));

class ThemeModeStateController extends StateNotifier<ThemeModeState> {
  ThemeModeStateController({ required ThemeMode data }) : super(const ThemeModeState()) {
    state = state.copyWith(themeMode: data);
  }
}
