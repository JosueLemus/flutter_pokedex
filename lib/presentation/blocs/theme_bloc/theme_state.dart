part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final bool isDarkMode;
  const ThemeState({required this.isDarkMode});
  @override
  List<Object> get props => [isDarkMode];
}

final class ThemeInitial extends ThemeState {
  const ThemeInitial({required super.isDarkMode});
}
