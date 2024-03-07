import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/text_styles.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Color pokemonColor;
  const GradientText({
    super.key,
    required this.text,
    required this.pokemonColor,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, pokemonColor],
            ).createShader(bounds);
          },
          child: Text(text,
              style: TextStyles.title.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2)),
        ),
        Container(
          height: 130,
          width: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                pokemonColor.withOpacity(0.8),
                pokemonColor,
              ])),
        )
      ],
    );
  }
}
