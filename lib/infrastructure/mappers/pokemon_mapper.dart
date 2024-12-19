import 'package:pokedex_flutter/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/infrastructure/models/pokemondb/pokemondb_response.dart';

// Esto sirve para agarrar la respuesta de pokeapi y transformarla
class PokemonMapper{

  static Pokemon pokemonDBToEntity(PokemonDbResponse pokemonDB){

    return Pokemon(
      name: pokemonDB.name,
      image: pokemonDB.sprites.other?.home.frontDefault,
      stadistics: {
        'HP': pokemonDB.stats[0].baseStat,
        'AT': pokemonDB.stats[1].baseStat,
        'AS': pokemonDB.stats[2].baseStat,
        'DF': pokemonDB.stats[3].baseStat,
        'DS': pokemonDB.stats[4].baseStat,
        'SP': pokemonDB.stats[5].baseStat
      }
    );
  }

}