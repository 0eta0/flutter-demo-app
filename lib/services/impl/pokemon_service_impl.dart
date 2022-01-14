import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo_app/models/pokemon.dart';

import "../pokemon_service.dart";

class PokemonServiceImpl implements PokemonService {
  PokemonServiceImpl(this._baseUrl);

  final String _baseUrl;

  @override
  Future<Pokemon> get({ required int id }) async {
    final res = await http.get(Uri.parse('$_baseUrl/pokemon/$id'));
    if (res.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to Load Pokemon');
    }
  }

  @override
  Future<List<Pokemon>> getList({ required int page, required int limit }) async {
    final baseIndex = page * limit;
    final maxIndex = baseIndex + limit;
    final List<Pokemon> list = [];
    for (int index = baseIndex; index <= maxIndex; index++) {
      final item = await get(id: index);
      list.add(item);
    }
    return list;
  }
}