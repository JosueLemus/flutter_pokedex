import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/presentation/widgets/pockeball_spin.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PokeballSpin(onFinish: () => context.pushReplacement('/home')));
  }
}
