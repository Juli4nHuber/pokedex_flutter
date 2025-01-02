import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_flutter/info_pokemon.dart';
import 'package:pokedex_flutter/extensions/extensions.dart';
import 'package:pokedex_flutter/pokemon_provider.dart';

import 'package:google_fonts/google_fonts.dart';


class PokemonScreen extends StatelessWidget {

  static const name = 'pantalla-pokemón';

  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final pokemon = context.watch<PokemonProvider>().pokemon;
    if (pokemon == null) {
      return Center(
        child: Image.asset('assets/images/spinnerPokeball.gif')
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () => context.read<PokemonProvider>().changePreviousPokemon(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                iconColor: Colors.white,
                padding: const EdgeInsets.all(0),
                minimumSize: const Size(0, 0)
              ),
              child: const Icon(
                Icons.arrow_left_rounded),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInImage.assetNetwork(
                    height: 264,
                    width: 264,
                    placeholder: 'assets/images/spinnerPokeball.gif',
                    image: pokemon.image, 
                    fit: BoxFit.contain
                  ),
                  Text(pokemon.name.toString().capitalize(), style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 16))
                ],
              ),
            ),
            ElevatedButton(
              onPressed:() => context.read<PokemonProvider>().changeNextPokemon(),
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                iconColor: Colors.white,
                padding: const EdgeInsets.all(0),
                minimumSize: const Size(0, 0)
              ),
              child: const Icon(Icons.arrow_right_rounded),
            )
          ],
        ), 
        SlidersStadistics(data: pokemon.stadistics),
      ]
    );
  }
}