import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_flutter/providers/pokeapi_provider.dart';
import 'package:pokedex_flutter/widgets/info_pokemon.dart';
import 'package:provider/provider.dart';
import 'extensions/extensions.dart';
import 'providers/pokeapi_provider.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokeapiProvider())
      ],
      child: MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                Color(0xFF181C14),
                Color(0xFF3C3D37),
                Color(0xFF3C3D37)
                ]
              )
            ),
            child: Consumer<PokeapiProvider>(
            builder: (context, pokeapiProvider, _){
              return FutureBuilder<Map<String, dynamic>>(
                future: pokeapiProvider.fetchPokemon(), // Usar la nue
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                  if(snapshot.hasData) {
                    final data = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () => pokeapiProvider.previousIdPokemon(),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  minimumSize: const Size(0, 0)
                                ),
                                child: const Icon(
                                  Icons.arrow_left_rounded),
                              ),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      FadeInImage.assetNetwork(
                                        height: 264,
                                        width: 264,
                                        placeholder: 'assets/images/spinnerPokeball.gif',
                                        image: data['sprites']['other']['home']['front_default'], 
                                        fit: BoxFit.contain
                                      ),
                                      Text(data['name'].toString().capitalize(), style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 16))
                                    ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed:() =>pokeapiProvider.nextIdPokemon(),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Colors.white,
                                  padding: const EdgeInsets.all(0),
                                  minimumSize: const Size(0, 0)
                                ),
                                child: const Icon(Icons.arrow_right_rounded),
                              )
                            ],
                          ), 
                        SlidersStadistics(data: data),
                      ]
                    );
                  }
                  return const Center(child: Text('No data found'));
                }
              );
            }
          )
        )
      )),
    );
  }  
}