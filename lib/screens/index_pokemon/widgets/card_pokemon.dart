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

    return Container(
      decoration: BoxDecoration(
        image: const DecorationImage(image: AssetImage('assets/images/grassCardBackground.jpg'), fit: BoxFit.cover, opacity: 0.5),
        border: Border.all(width: 2, color: Colors.white),
        borderRadius: const BorderRadius.all(Radius.circular(8))
      ),
      child: (pokemon != null) ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
              aspectRatio: 1,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/spinnerPokeball.gif', 
                image: pokemon!.sprites!.other!.showdown!.frontDefault!
              )
            )
          ,
          (pokemon!.types!.length == 1) ?
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/tipos/tipo_${pokemon!.types![0].type!.name}.png')
              ],
            ),
          )
          :
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/tipos/tipo_${pokemon!.types![0].type!.name}.png'),
                Image.asset('assets/images/tipos/tipo_${pokemon!.types![1].type!.name}.png')
              ],
            ),
          ),
        ],
      ) : null
    );
  }
}