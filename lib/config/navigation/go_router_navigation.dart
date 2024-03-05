import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/presentation/screens/details_screen.dart';
import 'package:pokedex/presentation/screens/home_screen.dart';
import 'package:pokedex/presentation/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/details/:pokemonid',
      name: 'details',
      builder: (BuildContext context, GoRouterState state) {
        return DetailsScreen(
            pokemonId: state.pathParameters['pokemonid'] ?? '');
      },
    )
  ],
);
