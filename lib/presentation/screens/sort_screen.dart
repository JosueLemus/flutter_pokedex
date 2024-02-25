import 'package:flutter/material.dart';
import 'package:pokedex/presentation/widgets/filters_appbar.dart';
import 'package:pokedex/presentation/widgets/primary_button.dart';
import 'package:pokedex/presentation/widgets/secondary_button.dart';

class SortScreen extends StatelessWidget {
  final String selectedSort;
  const SortScreen({super.key, required this.selectedSort});

  @override
  Widget build(BuildContext context) {
    final List<String> sortTypes = [
      "Smallest number first",
      "Highest number first",
      "A-Z",
      "Z-A"
    ];
    return Column(
      children: [
        const FiltersAppBar(
            title: "Sort",
            description:
                "Sort Pokémons alphabetically or by National Pokédex number!"),
        SizedBox(
          height: 400,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sortTypes.length,
              itemBuilder: (context, index) {
                final String sortType = sortTypes[index];
                final bool isSelected = selectedSort == sortType;
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 23, vertical: 12),
                    child: isSelected
                        ? PrimaryButton(title: sortType, onTap: () {})
                        : SecondaryButton(title: sortType, onTap: () {}));
              }),
        )
      ],
    );
  }
}
