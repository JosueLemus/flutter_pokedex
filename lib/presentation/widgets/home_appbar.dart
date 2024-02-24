import 'package:flutter/material.dart';
import 'package:pokedex/config/theme/text_styles.dart';

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
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _FilterButton(
                      asset: 'assets/images/home-filters/Generation.png',
                      onTap: () {}),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _FilterButton(
                        asset: 'assets/images/home-filters/Sort.png',
                        onTap: () {}),
                  ),
                  _FilterButton(
                      asset: 'assets/images/home-filters/Filter.png',
                      onTap: () {}),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Pokédex',
                style: TextStyles.applicationTitle,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 16),
                child: Text(
                    'Search for Pokémon by name or using the National Pokédex number.'),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "What Pokémon are you looking for?",
                  prefixIcon: Icon(Icons.search_outlined),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String asset;
  final Function() onTap;
  const _FilterButton({required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        asset,
        width: 25,
        height: 25,
      ),
    );
  }
}
