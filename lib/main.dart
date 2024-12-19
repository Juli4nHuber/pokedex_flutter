import 'package:flutter/material.dart';
import 'package:pokedex_flutter/presentation/screens/pokemon/pokemon_screen.dart';

import 'package:pokedex_flutter/config/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:pokedex_flutter/presentation/providers/provider.dart';


void main() {
  runApp(
    const ProviderScope(child: MainApp() )
  );
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