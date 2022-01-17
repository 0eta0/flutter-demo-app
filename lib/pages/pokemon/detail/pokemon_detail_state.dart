import 'package:demo_app/models/pokemon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail_state.freezed.dart';

@freezed
abstract class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    @Default(null) Pokemon? data,
  }) = _PokemonDetailState;
}
