import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences._();

  static const _themeModeKey = 'theme_mode';

  static final Preferences instance = Preferences._();

  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  SharedPreferences get _sharedPreferences {
    final prefs = _prefs;
    if (prefs == null) {
      throw StateError(
        'SharedPreferencesSingleton is not initialized. '
        'Call SharedPreferencesSingleton.instance.init() first.',
      );
    }
    return prefs;
  }

  ThemeMode getThemeMode() {
    final index =
        _sharedPreferences.getInt(_themeModeKey) ?? ThemeMode.light.index;

    if (index < 0 || index >= ThemeMode.values.length) {
      return ThemeMode.light;
    }

    return ThemeMode.values[index];
  }

  Future<void> setThemeMode(ThemeMode value) async {
    await _sharedPreferences.setInt(_themeModeKey, value.index);
  }
}
