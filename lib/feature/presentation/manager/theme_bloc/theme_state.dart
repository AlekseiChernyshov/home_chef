part of 'theme_bloc.dart';

class ThemeState extends Equatable{
  final bool isLightTheme;
  final ColorSeed colorSeed;

  const ThemeState({required this.isLightTheme, required this.colorSeed});

  ThemeState copyWith({bool? isLightTheme, ColorSeed? colorSeed}) {
    return ThemeState(
      isLightTheme: isLightTheme ?? this.isLightTheme,
      colorSeed: colorSeed ?? this.colorSeed,
    );
  }

  @override
  List<Object?> get props => [
    isLightTheme,
    colorSeed,
  ];
}

