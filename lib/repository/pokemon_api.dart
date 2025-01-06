import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:pokedex_flutter/models/pokemon.dart';

class PokemonApi {

  static Future<Pokemon> getPokemon({required String pokemon}) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemon/'));
    final json = await jsonDecode(response.body);
    return Pokemon.fromJson(json);
  }

  static Future<List<Pokemon>> getPokemonsPage({int page = 0, int limit = 18}) async {
    final offset = page * limit;
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'));
    final json = jsonDecode(response.body);
    
    final pokemonList = await Future.wait((json['results'] as List).map((pokemon) async {
        final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${pokemon['name']}/'));
        final json = jsonDecode(response.body);
        return Pokemon.fromJson(json);
      }),
    );
    return pokemonList;
  }

}