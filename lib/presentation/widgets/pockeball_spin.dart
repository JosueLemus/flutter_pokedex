import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PokeballSpin extends StatelessWidget {
  final Function? onFinish;
  const PokeballSpin({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinPerfect(
        onFinish: onFinish != null
            ? (direction) {
                onFinish!();
              }
            : null,
        child: Image.asset(
          'assets/images/pokeball.png',
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
    );
  }
}
