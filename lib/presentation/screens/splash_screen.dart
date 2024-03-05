import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinPerfect(
          onFinish: (direction) {
            context.go('/home');
          },
          child: Image.asset(
            'assets/images/pokeball.png',
          ),
        ),
      ),
    );
  }
}
