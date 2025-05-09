import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_chef/core/core.dart';
import 'package:home_chef/feature/feature.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoutes.homeDetailsScreenRoute);
          },
          child: Text('Go to Home Details'),
        ),
      ),
    );
  }
}

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Home Details')));
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoutes.searchDetailsScreenRoute);
          },
          child: Text('Go to search details'),
        ),
      ),
    );
  }
}

class SearchDetailsScreen extends StatelessWidget {
  const SearchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Search Details')));
  }
}



class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  Widget _trailingActions(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: BrightnessButton(
                  handleBrightnessChange: (value) =>
                      themeBloc.add(ToggleThemeEvent(value)),
                  showTooltipBelow: false,
                ),
              ),
              Flexible(
                child: ColorSeedButton(
                  handleColorSelect: (index) => context
                      .read<ThemeBloc>()
                      .add(ChangeColorSeedEvent(ColorSeed.values[index])),
                  colorSelected: state.colorSeed,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings Page')),
      body: Column(
        children: [
          _trailingActions(context),
        ],
      ),);
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Error Screen')));
  }
}


class LastScreen extends StatelessWidget {
  const LastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Last Page')));
  }
}

class IntermediateScreen extends StatelessWidget {
  const IntermediateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intermediate Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoutes.lastScreenRoute);
          },
          child: Text('Go to last screen'),
        ),
      ),);
  }
}
