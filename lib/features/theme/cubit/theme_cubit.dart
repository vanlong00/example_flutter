import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

const _kThemeModeKey = 'theme_mode';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._prefs) : super(ThemeState(themeMode: _loadTheme(_prefs)));

  final SharedPreferences _prefs;

  static ThemeMode _loadTheme(SharedPreferences prefs) {
    return switch (prefs.getString(_kThemeModeKey)) {
      'dark' => ThemeMode.dark,
      'light' => ThemeMode.light,
      _ => ThemeMode.system,
    };
  }

  void toggleTheme() {
    final next = state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _prefs.setString(_kThemeModeKey, next.name);
    emit(state.copyWith(themeMode: next));
  }

  void setTheme(ThemeMode mode) {
    _prefs.setString(_kThemeModeKey, mode.name);
    emit(state.copyWith(themeMode: mode));
  }
}
