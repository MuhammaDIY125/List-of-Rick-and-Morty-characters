import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../storage/preferences_service.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final Preferences _prefs;

  ThemeCubit(this._prefs) : super(_prefs.getThemeMode());

  Future<void> toggleTheme() async {
    final newThemeMode = state == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    await _prefs.setThemeMode(newThemeMode);
    emit(newThemeMode);
  }
}
