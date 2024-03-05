import 'package:flutter/material.dart';

class PokemonColors {
  static Map<String, String> typeColor = {
    'dark': '58575F',
    'dragon': '0F6AC0',
    'electric': 'EED535',
    'fairy': 'ED6EC7',
    'fighting': 'D04164',
    'fire': 'FD7D24',
    'flying': '748FC9',
    'ghost': '556AAE',
    'grass': '62B957',
    'ground': 'DD7748',
    'ice': '61CEC0',
    'normal': 'A8A878',
    'poison': 'A552CC',
    'psychic': 'EA5D60',
    'rock': 'BAAB82',
    'steel': '417D9A',
    'bug': '8CB230',
    'water': '4A90DA',
  };

  static Map<String, String> backgroundTypeColor = {
    'dark': '8BD674',
    'dragon': '7383B9',
    'electric': 'F2CB55',
    'fairy': 'EBA8C3',
    'fighting': 'EB4971',
    'fire': 'FFA756',
    'flying': '83A2E3',
    'ghost': '8571BE',
    'grass': '8BBE8A',
    'ground': 'F78551',
    'ice': '91D8DF',
    'normal': 'B5B9C4',
    'poison': '9F6E97',
    'psychic': 'FF6568',
    'rock': 'D4C294',
    'steel': '4C91B2',
    'bug': '8BD674',
    'water': '58ABF6',
  };

  static Color hexToColor(String code) {
    return Color(int.parse('FF$code', radix: 16));
  }

  static Color getTypeColor(String type) {
    return hexToColor(typeColor[type.toLowerCase()] ??
        'A8A8A8'); // Default to gray if the type is not found
  }

  static Color getBackgroundTypeColor(String type) {
    return hexToColor(backgroundTypeColor[type.toLowerCase()] ??
        'E0E0E0'); // Default to light gray if the type is not found
  }

  static Color getHeightColor(String height) {
    switch (height) {
      case 'short':
        return const Color(0xFFFFC5E6);
      case 'medium':
        return const Color(0xFFAEBFD7);
      case 'tall':
        return const Color(0xFFAAACB8);
      default:
        return const Color(0xFFE0E0E0);
    }
  }

  static Color getWeightColor(String weight) {
    switch (weight) {
      case 'light':
        return const Color(0xFF99CD7C);
      case 'normal':
        return const Color(0xFF57B2DC);
      case 'heavy':
        return const Color(0xFF5A92A5);
      default:
        return const Color(0xFFE0E0E0);
    }
  }
}
