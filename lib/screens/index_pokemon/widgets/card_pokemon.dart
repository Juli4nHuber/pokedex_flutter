import 'package:flutter/material.dart';
import 'package:pokedex_flutter/repository/pokemon_api.dart';
import 'package:pokedex_flutter/models/pokemon.dart';

class CardPokemon extends StatefulWidget {
  final String idPokemon;
  const CardPokemon({super.key, required this.idPokemon});

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {

  Pokemon? pokemon;

  @override
  void initState(){
    super.initState();
    loadPokemon();
  }

  void loadPokemon() async {
    final fetchPokemon = await PokemonApi.getPokemon(pokemon: widget.idPokemon);
    if(mounted){
      setState(() {
        pokemon = fetchPokemon;
      });
    }
  }

  @override
  Widget build(BuildContext context){

    if(pokemon == null) return Center(child: Image.asset('assets/images/spinnerPokeball.gif'));
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(image: AssetImage('assets/images/grassCardBackground.jpg'), fit: BoxFit.fill, opacity: 0.5),
          border: Border.all(width: 2, color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/spinnerPokeball.gif', 
          image: pokemon!.sprites!.other!.showdown!.frontDefault!),
      ),
    );
  }
}