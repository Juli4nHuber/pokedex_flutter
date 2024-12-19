import 'package:dio/dio.dart';

import 'package:pokedex_flutter/domain/datasources/pokemon_datasource.dart';

import 'package:pokedex_flutter/infrastructure/mappers/pokemon_mapper.dart';
import 'package:pokedex_flutter/infrastructure/models/pokemondb/pokemondb_response.dart';
import 'package:pokedex_flutter/domain/entities/pokemon.dart';


class MoviedbDatasource extends PokemonDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2/',
  ));


  @override
  Future<Pokemon> getPokemon({int idPokemon = 1}) async {
    
    final response = await dio.get("/pokemon/$idPokemon");
    final pokemondbResponse = PokemonDbResponse.fromJson(response.data);

    return  PokemonMapper.pokemonDBToEntity(pokemondbResponse); 
  }


}