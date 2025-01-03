import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokedex_flutter/models/pokemon.dart';

class PokemonApi {

  static Future<Pokemon> getPokemon({required String pokemon}) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemon/'));
    final json = await jsonDecode(response.body);
    return Pokemon.fromJson(json);
  }

  static Future<List<Pokemon>> getPokemonsPage({int page = 0, int limit = 20}) async {
    final offset = page * limit;
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'));
    final json = await jsonDecode(response.body);
    final pokemonList = json.results.map((pokemon) async {
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${pokemon['name']}/'));
      final json = await jsonDecode(response.body);
      return Pokemon.fromJson(json);
    }).toList();
    return pokemonList;
  }
}