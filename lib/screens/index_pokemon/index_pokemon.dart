import 'package:flutter/material.dart';
import 'package:pokedex_flutter/repository/pokemon_api.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/index_pokemon/widgets/card_pokemon.dart';

class IndexPokemon extends StatefulWidget {
  const IndexPokemon({super.key});

  @override
  State<IndexPokemon> createState() => _IndexPokemonState();
}

class _IndexPokemonState extends State<IndexPokemon> {

  List<Pokemon>? pokemons;

  @override
  void initState(){
    super.initState();
    loadPage();
  }

  void loadPage() async{
    final fetchPokemons = await PokemonApi.getPokemonsPage();
    setState(()  {
      pokemons = fetchPokemons;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if (pokemons == null) {
      return Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF181C14),
                Color(0xFF3C3D37),
                Color(0xFF3C3D37)
              ])),
              child: Center(
                  child: Image.asset('assets/images/spinnerPokeball.gif'))));
    }

    return GridView.count(
        crossAxisCount: 4,
        children: pokemons!.map((pokemon) => CardPokemon(idPokemon: pokemon.name!)).toList());
  }
}