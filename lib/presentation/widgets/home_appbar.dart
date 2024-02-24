import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/gradient-pokeball.png",
            // color: const Color(0xFFB5B9C4).withOpacity(0.05),
            color: Colors.red),
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 50, 23, 23),
          child: Column(
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
  const _FilterButton({super.key, required this.asset, required this.onTap});

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
