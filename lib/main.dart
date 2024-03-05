import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/theme/app_colors.dart';
import 'package:pokedex/config/theme/text_styles.dart';
import 'package:pokedex/presentation/blocs/filters_bloc/filters_bloc.dart';
import 'package:pokedex/presentation/blocs/pokemon_list_bloc/pokemon_list_bloc.dart';
import 'package:pokedex/presentation/screens/home_screen.dart';
import 'package:pokedex/presentation/screens/splash_screen.dart';

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.primary,
            hintColor: AppColors.textGrey,
            progressIndicatorTheme:
                const ProgressIndicatorThemeData(color: AppColors.primary),
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyles.description,
              fillColor: AppColors.backgroundDefaultInput,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            )),
        home: const SplashScreen());
  }
}
