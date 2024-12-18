import 'package:pokedex_flutter/domain/entities/pokemon.dart';

abstract class PokemonRepository {

  Future<Pokemon> getPokemon({ int idPokemon = 1 });

}