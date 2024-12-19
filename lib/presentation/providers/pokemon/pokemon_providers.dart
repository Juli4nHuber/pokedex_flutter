import 'package:pokedex_flutter/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/presentation/providers/pokemon/pokemon_repository_provider.dart';

import 'package:riverpod/riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<PokemonNotifier, Pokemon>((ref) {

  final fetchMoreMovies = ref.watch( pokemonRepositoryProvider ).getPokemon;

  return PokemonesNotifier(
    fetchPokemon: fetchPokemon
  );
});



typedef PokemonCallback = Future<Pokemon> Function({ int page });

class PokemonesNotifier extends StateNotifier<Pokemon> {
  
  int idPokemon = 0;
  PokemonCallback fetchMoreMovies;


  PokemonesNotifier({
    required this.fetchMoreMovies,
  }): super([]);

  Future<void> loadNextPage() async{
    idPokemon++;
    final Pokemon pokemon = await fetchPokemon( idPokemon: idPokemon );
    state = [...state, ...pokemon];
  }

    Future<void> loadPreviousPage() async{
    idPokemon--;
    final Pokemon pokemon = await fetchPokemon( idPokemon: idPokemon );
    state = [...state, ...pokemon];
  }



}