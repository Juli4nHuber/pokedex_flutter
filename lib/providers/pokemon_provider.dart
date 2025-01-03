import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pokedex_flutter/models/pokemon.dart';

class PokemonProvider extends ChangeNotifier {
  Pokemon? pokemon;

  PokemonProvider() {
    cargaPredeterminada();
  }

  void cargaPredeterminada() async {
    changePokemon(pokemon: '133');
    notifyListeners();
  }

  void changePokemon({required String pokemon}) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemon/'));
    final json = await jsonDecode(response.body);
    this.pokemon = Pokemon.fromJson(json);
    notifyListeners();
  }
  
}