import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeInitial(isDarkMode: false)) {
    _loadThemeFromSharedPreferences();
  }

  void _loadThemeFromSharedPreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final isDarkMode = prefs.getBool('isDarkMode') ?? false;
      emit(ThemeState(isDarkMode: isDarkMode));
    } catch (e) {
      print('Error loading theme from SharedPreferences: $e');
    }
  }

  void setCurrentTheme() {
    final isDarkMode = !state.isDarkMode;
    _saveThemeToSharedPreferences(isDarkMode);
    emit(ThemeState(isDarkMode: isDarkMode));
  }

  void _saveThemeToSharedPreferences(bool isDarkMode) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', isDarkMode);
    } catch (e) {
      print('Error saving theme to SharedPreferences: $e');
    }
  }
}
