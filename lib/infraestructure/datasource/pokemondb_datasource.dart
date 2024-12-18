import 'package:dio/dio.dart';
import 'package:pokedex_flutter/domain/datasources/pokemon_datasource.dart';
import 'package:pokedex_flutter/domain/entities/pokemon.dart';

class PokemondbDatasource extends PokemonDatasource {


  final dio = Dio(BaseOptions(
    baseUrl: 'https://pokeapi.co/api/v2/pokemon'
  ));

  @override
  Future<Pokemon> getNowPlaying({ int idPokemon = 1 }) async {

    final response = await dio.get('$idPokemon');
    final Pokemon pokemon;

    return Pokemon(name: 'a', image: 'b', stadistics: {'a': 2, 'b': 5, 'c': 7});
  }

}