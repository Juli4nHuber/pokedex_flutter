import 'package:flutter/material.dart';
import 'package:pokedex_flutter/presentation/screens/pokemon/pokemon_screen.dart';

import 'package:pokedex_flutter/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const PokemonScreen()
    );
  }  
}