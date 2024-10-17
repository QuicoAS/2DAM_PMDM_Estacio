import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';
import 'package:flutter_counter_bloc/config/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
        appTheme: AppTheme(),
      )) {
    on<ThemeChanged>(_onThemeChanged);
  }

  void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) {
    emit(
      state.copyWith(
        appTheme: AppTheme(
          isDarkmode: event.isDarkMode,
          selectedColor: event.selectedColor,
        ),
      ),
    );
  }
}
