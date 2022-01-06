
import 'package:demo_app/objects/pokemon_model.dart';
import 'package:demo_app/networks/pokemon_request.dart';
import 'package:flutter/material.dart';

class PokemonNotifier extends ChangeNotifier {

  final Map<int, Pokemon?> _pokeMap = {};

  Map<int, Pokemon?> get pokes => _pokeMap;

  void addPoke(Pokemon poke) {
    _pokeMap[poke.id] = poke;
    notifyListeners();
  }

  void getPokemon(int id) async {
    _pokeMap[id] = null;
    addPoke(await fetchPokemon(id));
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) {
      getPokemon(id);
    }
    return _pokeMap[id];
  }
}