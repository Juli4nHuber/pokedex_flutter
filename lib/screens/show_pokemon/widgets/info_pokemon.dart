import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/pokemon.dart';
import 'package:pokedex_flutter/screens/show_pokemon/widgets/slider_stadistic.dart';

class SlidersStadistics extends StatelessWidget {
  const SlidersStadistics({
    super.key,
    required this.data,
  });

  final List<Stat> data;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SliderStadistic(textEstadistics: 'PS', color: Colors.red[200], value: data[0].baseStat!,  isPV: true),
        SliderStadistic(textEstadistics: 'AF', color: Colors.red[200], value: data[1].baseStat!),
        SliderStadistic(textEstadistics: 'DE', color: Colors.red[200], value: data[2].baseStat!),
        SliderStadistic(textEstadistics: 'SA', color: Colors.red[200], value: data[3].baseStat!),
        SliderStadistic(textEstadistics: 'SD', color: Colors.red[200], value: data[4].baseStat!),
        SliderStadistic(textEstadistics: 'VEL', color: Colors.red[200], value: data[5].baseStat!)
      ]
    );
  }
}