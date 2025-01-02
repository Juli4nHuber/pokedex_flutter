import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pokedex_flutter/pokemon_screen.dart';
import 'package:pokedex_flutter/config/theme/app_theme.dart';
import 'pokemon_provider.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => PokemonProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                  Color(0xFF181C14),
                  Color(0xFF3C3D37),
                  Color(0xFF3C3D37)
                  ]
                )
              ),
              child: const PokemonScreen()
            )
          )
        )
    );
  }  
}