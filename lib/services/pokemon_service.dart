import 'package:demo_app/models/pokemon.dart';

abstract class PokemonService {
  Future<Pokemon> get({ required int id });
  Future<List<Pokemon>> getList({ required int page, required int limit });
}