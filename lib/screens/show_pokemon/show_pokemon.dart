import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_flutter/screens/show_pokemon/widgets/info_pokemon.dart';
import 'package:pokedex_flutter/extensions/extensions.dart';
import 'package:pokedex_flutter/providers/pokemon_provider.dart';

import 'package:google_fonts/google_fonts.dart';

class PokemonScreen extends StatefulWidget {
  static const name = 'pantalla-pokemón';

  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    final pokemon = context.watch<PokemonProvider>().pokemon;
    if (pokemon == null) {
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

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF181C14),
              Color(0xFF3C3D37),
              Color(0xFF3C3D37)
            ])),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => context
                          .read<PokemonProvider>()
                          .changePokemon(pokemon: (pokemon.id! - 1).toString()),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          iconColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                          minimumSize: const Size(0, 0)),
                      child: const Icon(Icons.arrow_left_rounded),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Dismissible(
                              key: ValueKey(pokemon.id),
                              direction: DismissDirection.horizontal,
                              onDismissed: (direction) {
                                if (direction == DismissDirection.startToEnd) {
                                  // Deslizó hacia la derecha
                                  context.read<PokemonProvider>().changePokemon(
                                      pokemon: (pokemon.id! - 1).toString());
                                } else if (direction ==
                                    DismissDirection.endToStart) {
                                  // Deslizó hacia la izquierda
                                  context.read<PokemonProvider>().changePokemon(
                                      pokemon: (pokemon.id! + 1).toString());
                                }
                              },
                              child: FadeInImage.assetNetwork(
                                  key: ValueKey(pokemon.id),
                                  height: 264,
                                  width: 264,
                                  placeholder:
                                      'assets/images/spinnerPokeball.gif',
                                  image: pokemon
                                      .sprites!.other!.home!.frontDefault!,
                                  fit: BoxFit.contain)),
                          Text(pokemon.name.toString().capitalize(),
                              style: GoogleFonts.pressStart2p(
                                  color: Colors.white, fontSize: 16))
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => context
                          .read<PokemonProvider>()
                          .changePokemon(pokemon: (pokemon.id! + 1).toString()),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          iconColor: Colors.white,
                          padding: const EdgeInsets.all(0),
                          minimumSize: const Size(0, 0)),
                      child: const Icon(Icons.arrow_right_rounded),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: (pokemon.types!.length == 1)
                    ? Image.asset(
                        'assets/images/tipos/tipo_${pokemon.types![0].type!.name}.png')
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset(
                                'assets/images/tipos/tipo_${pokemon.types![0].type!.name}.png'),
                            const SizedBox(width: 10),
                            Image.asset(
                                'assets/images/tipos/tipo_${pokemon.types![1].type!.name}.png')
                          ]),
              ),
              SlidersStadistics(data: pokemon.stats!),
              Text('Nº ${pokemon.id}',
                  style: GoogleFonts.pressStart2p(
                      color: Colors.white, fontSize: 10))
            ])));
  }
}
