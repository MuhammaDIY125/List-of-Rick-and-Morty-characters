import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/navigation/navigation_shell.dart';
import '/features/characters/presentation/pages/characters_page.dart';
import '/features/favorites/presentation/pages/favorites_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _charactersNavigatorKey = GlobalKey<NavigatorState>();
final _favoritesNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/characters',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return NavigationShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _charactersNavigatorKey,
          routes: [
            GoRoute(
              path: '/characters',
              builder: (context, state) => const CharactersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _favoritesNavigatorKey,
          routes: [
            GoRoute(
              path: '/favorites',
              builder: (context, state) => const FavoritesPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
