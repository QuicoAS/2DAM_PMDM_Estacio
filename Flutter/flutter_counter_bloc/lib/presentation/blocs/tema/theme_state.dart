import 'package:flutter/material.dart';
import 'package:flutter_counter_bloc/config/theme/app_theme.dart';

class ThemeState {
  final AppTheme appTheme;

  const ThemeState({required this.appTheme});

  ThemeState copyWith({AppTheme? appTheme}) {
    return ThemeState(appTheme: appTheme ?? this.appTheme);
  }

  ThemeData get themeData => appTheme.getTheme();
}
