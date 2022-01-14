import 'package:demo_app/models/pokemon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "pokemon_list_state.freezed.dart";

@freezed
abstract class PokemonListState with _$PokemonListState {
  const factory PokemonListState({
    @Default(null) Pokemon? data,
  }) = _PokemonListState;
}
