import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/helpers/string_helpers.dart';
import 'package:pokedex/config/theme/pokemon_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_details.dart';
import 'package:pokedex/presentation/blocs/pokemon_details_bloc/pokemon_details_bloc.dart';
import 'package:pokedex/presentation/widgets/about_pokemon_details.dart';
import 'package:pokedex/presentation/widgets/gradient_text.dart';
import 'package:pokedex/presentation/widgets/pockeball_spin.dart';
import 'package:pokedex/presentation/widgets/pokemon_detail.dart';
import 'package:pokedex/presentation/widgets/stats_pokemon_details.dart';

class DetailsScreen extends StatelessWidget {
  final String pokemonId;

  const DetailsScreen({Key? key, required this.pokemonId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonDetailsBloc(pokemonId),
      child: BlocBuilder<PokemonDetailsBloc, PokemonDetailsState>(
        builder: (context, state) {
          if (state.isLoading || state.pokemon == null) {
            return const Scaffold(body: PokeballSpin(onFinish: null));
          }
          return _DetailsView(pokemon: state.pokemon!);
        },
      ),
    );
  }
}

class _DetailsView extends StatefulWidget {
  final PokemonDetails pokemon;
  const _DetailsView({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<_DetailsView> createState() => __DetailsViewState();
}

class __DetailsViewState extends State<_DetailsView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void goBack() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        PokemonColors.getBackgroundTypeColor(widget.pokemon.pokemonTypes[0]);
    final pokemon = widget.pokemon;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Container(
              color: backgroundColor,
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: -20,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: BounceInUp(
                        child: GradientText(
                            text: pokemon.name.toUpperCase(),
                            pokemonColor: backgroundColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: goBack,
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: BounceInRight(
                                child: Image.network(
                                  StringHelpers.getPokemonImageUrl(pokemon.id),
                                  width: 125,
                                  height: 125,
                                ),
                              ),
                            ),
                            Expanded(
                              child: BounceInLeft(
                                child: PokemonDetail(
                                    pokemon: Pokemon(
                                        id: pokemon.id,
                                        name: pokemon.name,
                                        pokemonTypes: pokemon.pokemonTypes)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: backgroundColor,
              child: TabBar(
                controller: _tabController,
                onTap: (value) {
                  setState(() {});
                },
                physics: const NeverScrollableScrollPhysics(),
                tabs: [
                  _CustomChildTab(
                      title: 'About', selected: _tabController.index == 0),
                  _CustomChildTab(
                      title: 'Stats', selected: _tabController.index == 1),
                  _CustomChildTab(
                      title: 'Evolution', selected: _tabController.index == 2),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  _BodyTab(
                      child: AboutPokemonDetails(
                    pokemon: pokemon,
                  )),
                  _BodyTab(
                      child: StatsPokemonDetails(
                    pokemon: pokemon,
                  )),
                  _BodyTab(child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BodyTab extends StatelessWidget {
  final Widget child;
  const _BodyTab({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: child,
      ),
    );
  }
}

class _CustomChildTab extends StatelessWidget {
  final String title;
  final bool selected;
  const _CustomChildTab({required this.title, required this.selected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          if (selected)
            Transform.scale(
                scaleY: -1,
                child: Image.asset(
                  'assets/images/gradient-pokeball.png',
                  color: Colors.white.withOpacity(0.15),
                  width: double.infinity,
                )),
          Center(
              child: Text(title,
                  style: TextStyles.filterTitle.copyWith(color: Colors.white))),
        ],
      ),
    );
  }
}
