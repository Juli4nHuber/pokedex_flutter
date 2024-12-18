import 'package:pokedex_flutter/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/infraestructure/models/pokemondb/pokemondb_response.dart';
class MovieMapper{

  static Pokemon pokemonDBToEntity(PokemonDbResponse pokemonDB){
  
    stadistics = [];

    pokemonDB.stats.forEach((stat) {
      
    })

    return Pokemon(
      name: pokemonDB.name,
      image: pokemonDB.sprites.other?.home.frontDefault,
      stadistics: 
    );
  }

}