import 'package:flutter/material.dart';
import 'package:pokedex_flutter/repository/pokemon_api.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/index_pokemon/widgets/card_pokemon.dart';
class IndexPokemon extends StatefulWidget {
  const IndexPokemon({super.key});

  @override
  State<IndexPokemon> createState() => _IndexPokemonState();
}

class _IndexPokemonState extends State<IndexPokemon> {
  List<Pokemon>? pokemons;
  bool isLoading = false;
  int page = 0;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    loadPage(page);

    _scrollController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
  }

  void loadPage(int page) async {
    final fetchPokemons = await PokemonApi.getPokemonsPage(page: page);
    setState(() {
      if (pokemons == null) {
        pokemons = fetchPokemons;
      } else {
        pokemons = pokemons! + fetchPokemons;
      }
    });
  }

  _scrollListener() {
    if (_scrollController!.offset >=
            _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {
      setState(() {
        isLoading = true;
        if (isLoading) {
          page++;
          loadPage(page);
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (pokemons == null) {
      return Scaffold(
          body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xFF181C14),
                Color(0xFF3C3D37),
                Color(0xFF3C3D37)
              ])),
              child: Center(
                  child: Image.asset('assets/images/spinnerPokeball.gif'))));
    }

    return GridView.count(
        controller: _scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 0.75,
        children: pokemons!
            .map((pokemon) => CardPokemon(idPokemon: pokemon.name!))
            .toList());
  }
}
