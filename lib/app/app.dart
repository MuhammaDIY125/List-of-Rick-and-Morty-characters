import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/di/service_locator.dart';
import '/core/navigation/router.dart';
import '/core/theme/app_theme.dart';
import '/features/favorites/presentation/cubit/favorites_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FavoritesCubit>()..loadFavorites(),
      child: MaterialApp.router(
        title: 'Rick & Morty',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: router,
      ),
    );
  }
}
