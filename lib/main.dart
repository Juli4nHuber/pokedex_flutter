import 'package:flutter/material.dart';
import 'package:pokedex_flutter/screens/index_pokemon/index_pokemon.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_flutter/screens/show_pokemon/show_pokemon.dart';
import 'package:pokedex_flutter/config/theme/app_theme.dart';
import 'providers/pokemon_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => PokemonProvider())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          initialRoute: '/pokemons',
          routes: {
            '/': (context) => const PokemonScreen(),
            '/pokemons': (context) => const IndexPokemon(),
          }
        ));
  }
}
