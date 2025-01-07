import 'package:flutter/material.dart';
import 'package:pokedex_flutter/repository/pokemon_api.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/index_pokemon/widgets/card_pokemon.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
class IndexPokemon extends StatefulWidget {
  const IndexPokemon({super.key});

  @override
  State<IndexPokemon> createState() => _IndexPokemonState();
}

class _IndexPokemonState extends State<IndexPokemon> {
  static const int _pageSize = 18;

  final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newPokemons = await PokemonApi.getPokemonsPage(page: pageKey);
      final isLastPage = newPokemons.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newPokemons);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newPokemons, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF181C14),
              Color(0xFF3C3D37),
              Color(0xFF3C3D37),
            ]
          )
        ),
        child: PagedGridView<int, Pokemon>(
          pagingController: _pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 0.75
          ),
          builderDelegate: PagedChildBuilderDelegate<Pokemon>(
            itemBuilder: (context, pokemon, index) => CardPokemon(
              idPokemon: pokemon.name!
            ),
            firstPageProgressIndicatorBuilder: (_) => Center(
              child: Image.asset('assets/images/spinnerPokeball.gif')
            ),
            newPageProgressIndicatorBuilder: (_) => CircularProgressIndicator()
          )
        )
      )
    );
  }
}
