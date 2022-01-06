import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo_app/objects/pokemon_model.dart';
import 'package:demo_app/consts/poke_api.dart';

Future<Pokemon> fetchPokemon(int id) async {
  final res = await http.get(Uri.parse('$pokeApiRoute/pokemon/$id'));
  if (res.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to Load Pokemon');
  }
}