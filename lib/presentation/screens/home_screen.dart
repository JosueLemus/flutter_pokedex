import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex/presentation/widgets/home_appbar.dart';
import 'package:pokedex/presentation/widgets/pokemons_list.dart';

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
      body: SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: const [HomeAppBar(), PokemonsList()],
        ),
      ),
    );
  }
}
