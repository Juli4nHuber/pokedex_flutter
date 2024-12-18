import 'package:pokedex_flutter/domain/datasources/pokemon_datasource.dart';
import 'package:pokedex_flutter/domain/entities/pokemon.dart';

class PokemondbDatasource extends PokemonDatasource {

  @override
  Future<Pokemon> getPokemon({ int idPokemon = 1}) async {
    return Pokemon(name: 'a', image: 'b', stadistics: {'a': 2, 'b': 5, 'c': 7});
  }

}