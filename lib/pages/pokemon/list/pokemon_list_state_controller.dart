import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state.dart';
import 'package:demo_app/repositories/pokemon_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokemonListStateControllerProvider = StateNotifierProvider.autoDispose<PokemonListStateController, PokemonListState>((ref) => PokemonListStateController(ref.read(pokemonRepositoryProvider)));

class PokemonListStateController extends StateNotifier<PokemonListState> {
  PokemonListStateController(this._repos) : super(const PokemonListState());

  final PokemonRepository _repos;

  Future<void> init() async {
    List<Pokemon> value = await _repos.getList(page: 0);
    state = state.copyWith(list: value);
  }
}
