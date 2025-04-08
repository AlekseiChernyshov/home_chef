import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_chef/core/core.dart';
import 'package:home_chef/feature/feature.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _useLightMode;

  @override
  void initState() {
    super.initState();
    // Инициализируем _useLightMode в initState(), чтобы избежать ошибок при доступе к context
    _useLightMode = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.light;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(_useLightMode),
      child: const MaterialAppRouter(),
    );
  }
}

class MaterialAppRouter extends StatelessWidget {
  const MaterialAppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: state.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          theme: AppThemes.lightTheme(state.colorSeed),
          darkTheme: AppThemes.darkTheme(state.colorSeed),
          routerConfig: MyRouter.router,
        );
      },
    );
  }
}
