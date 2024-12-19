import 'package:pokedex_flutter/domain/entities/pokemon.dart';
import 'package:pokedex_flutter/domain/datasources/pokemon_datasource.dart';
import 'package:pokedex_flutter/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl extends PokemonRepository {

  final PokemonDatasource datasource;
  PokemonRepositoryImpl(this.datasource);
  
  @override
  Future<Pokemon> getPokemon({int idPokemon = 1}) {
    return datasource.getPokemon(idPokemon: idPokemon);
  }

}