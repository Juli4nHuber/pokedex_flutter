import 'package:riverpod/riverpod.dart';

import 'package:pokedex_flutter/infrastructure/datasource/pokemondb_datasource.dart';
import 'package:pokedex_flutter/infrastructure/repositories/pokemon_repository_impl.dart';

final pokemonRepositoryProvider = Provider((ref) {
  return PokemonRepositoryImpl( MoviedbDatasource() );
});