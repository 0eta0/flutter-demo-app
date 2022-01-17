import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state.dart';
import 'package:demo_app/repositories/pokemon_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pokemonListStateControllerProvider = StateNotifierProvider.autoDispose<PokemonListStateController, PokemonListState>((ref) => PokemonListStateController(ref.read(pokemonRepositoryProvider)));
final displayModeStateControllerProvider = StateNotifierProvider.autoDispose<DisplayModeStateController, DisplayMode>((ref) => DisplayModeStateController());

class PokemonListStateController extends StateNotifier<PokemonListState> {
  PokemonListStateController(this._repos) : super(const PokemonListState());

  final PokemonRepository _repos;

  Future<void> init() async {
    List<Pokemon> value = await _repos.getList(page: state.page);
    state = state.copyWith(list: value);
  }

  Future<void> getNext() async {
    List<Pokemon> value = await _repos.getList(page: state.page + 1);
    state = state.copyWith(list: state.list + value, page: state.page + 1);
  }
}

enum DisplayMode {
  list,
  grid,
}

class DisplayModeStateController extends StateNotifier<DisplayMode> {
  DisplayModeStateController() : super(DisplayMode.list);
  void update(DisplayMode newValue) {
    state = newValue;
  }
}
