import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/pages/pokemon/detail/pokemon_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokemonStateControllerProvider = StateNotifierProvider.autoDispose<PokemonStateController, PokemonDetailState>((ref) => throw UnimplementedError());
final pokemonStateControllerProviderFamily = StateNotifierProvider.family.autoDispose<PokemonStateController, PokemonDetailState, Pokemon>((ref, data) => PokemonStateController(data: data));

class PokemonStateController extends StateNotifier<PokemonDetailState> {
  PokemonStateController({required Pokemon data}) : super(const PokemonDetailState()) {
    state = state.copyWith(data: data);
  }
}
