import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/navigation/go_router_navigation.dart';
import 'package:pokedex/config/theme/app_theme.dart';
import 'package:pokedex/presentation/blocs/filters_bloc/filters_bloc.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';

void main() => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonListBloc()),
        BlocProvider(create: (context) => FiltersBloc()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}
