import 'package:pokedex_flutter/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/domain/repositories/pokemon_repository.dart';

abstract class PokemonRepository {

  Future<Pokemon> getPokemon({ int idPokemon = 1 });

}