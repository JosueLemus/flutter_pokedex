import 'package:flutter/material.dart';
import 'package:pokedex/presentation/widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [HomeAppBar()],
      ),
    );
  }
}
