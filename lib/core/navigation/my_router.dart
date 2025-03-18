import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_chef/core/core.dart';
import 'package:home_chef/feature/feature.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');

class MyRouter {
  static GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppPath.homeScreenPath,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          // Ветка Home
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.homeScreenRoute,
                path: AppPath.homeScreenPath,
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    name: AppRoutes.homeDetailsScreenRoute,
                    path: AppPath.homeDetailsScreenPath,
                    builder: (context, state) => HomeDetailsScreen(),
                  ),
                ],
              ),
            ],
          ),
          // Ветка Search
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.searchScreenRoute,
                path: AppPath.searchScreenPath,
                builder: (context, state) => SearchScreen(),
                routes: [
                  GoRoute(
                    name: AppRoutes.searchDetailsScreenRoute,
                    path: AppPath.searchDetailsScreenPath,
                    builder: (context, state) => SearchDetailsScreen(),
                  ),
                ],
              ),
            ],
          ),
          // Ветка Favorite
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.favoriteScreenRoute,
                path: AppPath.favoriteScreenPath,
                builder: (context, state) => FavoritePage(),
                routes: [
                  GoRoute(
                      name: AppRoutes.intermediateScreenRoute,
                      path: AppPath.intermediateScreenPath,
                      builder: (context, state) => IntermediateScreen(),
                      routes: [
                        GoRoute(
                          parentNavigatorKey: _rootNavigatorKey,
                          name: AppRoutes.lastScreenRoute,
                          path: AppPath.lastScreenPath,
                          builder: (context, state) => LastScreen(),
                        ),
                      ]
                  ),
                ],
              ),
            ],
          ),
          // Ветка Settings
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.settingsScreenRoute,
                path: AppPath.settingsScreenPath,
                builder: (context, state) => SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
  );
}