import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokemonListStateControllerProvider = StateNotifierProvider.autoDispose<PokemonListStateController, PokemonListState>((ref) => throw UnimplementedError());
final pokemonListStateControllerProviderFamily = StateNotifierProvider.autoDispose.family<PokemonListStateController, PokemonListState, Pokemon>((ref, data) => PokemonListStateController(data: data));

class PokemonListStateController extends StateNotifier<PokemonListState> {
  PokemonListStateController({ required Pokemon data }) : super(const PokemonListState()) {
    state = state.copyWith(data: data);
  }
}
