import 'package:http/http.dart' as http;

import "../pokemon.dart";

class PokemonServiceImpl implements PokemonService {
  PokemonServiceImpl(this._baseUrl);
  
  final String _baseUrl;

  Future<Pokemon> get({ required int id }) async {
    final res = await http.get(Uri.parse('$_baseUrl/pokemon/$id'));
    if (res.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(res.body));
    } else {
      throw Exception('Failed to Load Pokemon');
    }
  };

  Future<List<Pokemon>> getList({ required int page, required int limit }) async {
    const baseIndex = page * limit;
    const maxIndex = baseIndex + limit;
    final List<Pokemon> list = [];
    for (int index = baseIndex; index <= maxIndex; index++) {
      list.add(get(index));
    }
    return list;
  };
} 