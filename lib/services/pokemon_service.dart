import 'package:demo_app/models/pokemon.dart';
import 'impl/pokemon_service_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const String _baseUrl = "https://pokeapi.co/api/v2";

final pokemonServiceProvider = Provider.autoDispose<PokemonService>((ref) => PokemonServiceImpl(_baseUrl));

abstract class PokemonService {
  Future<Pokemon> get({ required int id });
  Future<List<Pokemon>> getList({ required int page, required int limit });
}