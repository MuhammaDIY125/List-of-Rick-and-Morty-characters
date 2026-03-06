import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/navigation/navigation_shell.dart';
import '/features/characters/domain/models/character.dart';
import '/features/characters/presentation/pages/character_details_page.dart';
import '/features/characters/presentation/pages/characters_page.dart';
import '/features/favorites/presentation/pages/favorites_page.dart';

/*
  Используем StatefulShellRoute, чтобы каждая вкладка сохраняла свой стек страниц,
  а GlobalKey — чтобы управлять навигацией внутри этих вкладок.
*/

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
              routes: [
                GoRoute(
                  path: 'character/:id',
                  builder: (context, state) {
                    final character = state.extra as Character;
                    return CharacterDetailsPage(character: character);
                  },
                ),
              ],
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
