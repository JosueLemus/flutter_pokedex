import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/gradient-pokeball.png",
          color: const Color(0xFFB5B9C4).withOpacity(0.05),
        ),
      ],
    );
  }
}
