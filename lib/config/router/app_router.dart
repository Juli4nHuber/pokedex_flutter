import 'package:go_router/go_router.dart';

import 'package:pokedex_flutter/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/', 
      name: PokemonScreen.name,
      builder: (context, state) => const PokemonScreen()
    )
  ]
);