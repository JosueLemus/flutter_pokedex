import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyles.description,
          fillColor: const Color(0xFFF2F2F2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        )),
        home: const HomeScreen());
  }
}
