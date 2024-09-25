import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/widgets/info_pokemon.dart';
import 'extensions/extensions.dart';

void main() {
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
   
    Future<Map<String, dynamic>> fetchPokemon() async {
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/132'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load info of PokeApi');
      }
    }



    return MaterialApp(
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
          child: FutureBuilder<Map<String, dynamic>>(
          future: fetchPokemon(), // Usar la nue
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
                            onPressed: () {
                              // Acción al presionar el botón
                              print('Botón presionado');
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              iconColor: Colors.white,
                              padding: EdgeInsets.all(0),
                              minimumSize: Size(0, 0)
                            ),
                            child: const Icon(
                              Icons.arrow_left_rounded),
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.network(data['sprites']['other']['home']['front_default'], fit: BoxFit.contain),
  
                                  Text(data['name'].toString().capitalize(), style: GoogleFonts.pressStart2p(color: Colors.white, fontSize: 16),)
                                ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Acción al presionar el botón
                              print('Botón presionado');
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              iconColor: Colors.white,
                              padding: EdgeInsets.all(0),
                              minimumSize: Size(0, 0)
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
          })
        )
      )
    );
  }  
}