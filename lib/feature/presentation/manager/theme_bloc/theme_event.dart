part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable{
  const ThemeEvent();
  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {
  const ToggleThemeEvent(this.isLightTheme);
  final bool isLightTheme;
}

class ChangeColorSeedEvent extends ThemeEvent {
  const ChangeColorSeedEvent(this.colorSeed);
  final ColorSeed colorSeed;
}



