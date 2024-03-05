import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex/presentation/widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  late PokemonListBloc _pokemonListBloc;

  @override
  void initState() {
    super.initState();
    _pokemonListBloc = context.read<PokemonListBloc>();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isScrollNearBottom) {
      _pokemonListBloc.add(GetPokemonList());
    }
  }

  bool get _isScrollNearBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return maxScroll - currentScroll <= 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HomeAppBar(),
          Expanded(
            child: BlocBuilder<PokemonListBloc, PokemonListState>(
              buildWhen: (previous, current) {
                return (previous.pokemonList != current.pokemonList) ||
                    current.isLoading;
              },
              builder: (context, state) {
                final pokemonList = state.pokemonList;
                if (state.isLoading && state.pokemonList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () async {
                    _pokemonListBloc.add(ReloadData());
                  },
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      controller: _scrollController,
                      itemCount: state.isLoading
                          ? pokemonList.length + 1
                          : pokemonList.length,
                      itemBuilder: (context, index) {
                        if (state.isLoading && index == pokemonList.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 32),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        final pokemon = pokemonList[index];
                        return ListTile(
                          title: Text(pokemon.name),
                          subtitle: Text(pokemon.id.toString()),
                          onTap: () {
                            context.pushNamed('details', pathParameters: {
                              'pokemonid': pokemon.id.toString()
                            });
                          },
                        );
                      }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
