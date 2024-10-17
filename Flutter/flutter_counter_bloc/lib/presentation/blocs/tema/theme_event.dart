abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final bool isDarkMode;
  final int selectedColor;

  const ThemeChanged({required this.isDarkMode, required this.selectedColor});
}
