import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/theme/theme_cubit.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return IconButton(
          onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
          tooltip: 'Toggle Theme',
        );
      },
    );
  }
}
