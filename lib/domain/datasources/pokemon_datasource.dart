import 'package:pokedex_flutter/domain/entities/pokemon.dart';

abstract class PokemonDatasource {

  Future<Pokemon> getPokemon({ int idPokemon = 1 }) ;

}