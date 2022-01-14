
import 'package:flutter/material.dart';
import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/services/pokemon_service.dart';
import "package:hooks_riverpod/hooks_riverpod.dart";

abstract class PokemonRepository {

  Future<Pokemon> get({ required int id });
  Future<List<Pokemon>> getList({ required int page, int limit = 10 });
}

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonRepositoryImpl(this._service);

  final PokemonService _service;

  @override
  Future<Pokemon> get({ required int id }) async {
    return _service.get(id: id);
  }

  @override
  Future<List<Pokemon>> getList({ required int page, int limit = 10 }) async {
    return _service.getList(page: page, limit: limit);
  }
}