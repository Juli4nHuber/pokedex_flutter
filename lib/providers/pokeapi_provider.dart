import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokeapiProvider extends ChangeNotifier {

  var idPokemonApi = 153;

  void nextIdPokemon() {
    idPokemonApi++;
    notifyListeners();
  }

  void previousIdPokemon() {
    idPokemonApi--;
    notifyListeners();
  }

  Future<Map<String, dynamic>> fetchPokemon() async {
    final response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/$idPokemonApi"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load info of PokeApi');
    }
  }

}