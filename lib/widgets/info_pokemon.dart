import 'package:flutter/material.dart';
import 'slider_stadistic.dart';

class SlidersStadistics extends StatelessWidget {
  const SlidersStadistics({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderStadistic(textEstadistics: 'PS', color: Colors.red[200], value: data['stats'][0]['base_stat'], isPV: true),
        SliderStadistic(textEstadistics: 'AF', color: Colors.red[200], value: data['stats'][1]['base_stat']),
        SliderStadistic(textEstadistics: 'AE', color: Colors.red[200], value: data['stats'][3]['base_stat']),
        SliderStadistic(textEstadistics: 'DF', color: Colors.red[200], value: data['stats'][2]['base_stat']),
        SliderStadistic(textEstadistics: 'DE', color: Colors.red[200], value: data['stats'][4]['base_stat']),
        SliderStadistic(textEstadistics: 'VEL', color: Colors.red[200], value: data['stats'][5]['base_stat']),
      ]
    );
  }
}