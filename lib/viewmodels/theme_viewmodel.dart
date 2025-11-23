import 'package:flutter/material.dart';

enum AppTheme { dark, light }

@immutable
class ThemeViewModel {
  const ThemeViewModel();

  static const Color primary = Color(0xFF23619E);
  static const Color secondary = Color(0xFFC4CCD8);

  ThemeData get lightTheme => ThemeData(
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: secondary,
    ),
    useMaterial3: true,
  );

  ThemeData get darkTheme => ThemeData(
    colorScheme: const ColorScheme.dark(primary: primary, secondary: secondary),
    useMaterial3: true,
  );

  // Command theme removed; use light/dark only as requested.

  void applyTheme(BuildContext context, AppTheme theme) {
    final state = AppStateScope.of(context);
    switch (theme) {
      case AppTheme.dark:
        state?.setTheme(dark: true);
        break;
      case AppTheme.light:
        state?.setTheme(dark: false);
        break;
    }
  }
}

class AppStateScope extends InheritedWidget {
  final ThemeSetter state;
  const AppStateScope({required this.state, required super.child, super.key});

  static ThemeSetter? of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    return widget?.state;
  }

  @override
  bool updateShouldNotify(covariant AppStateScope oldWidget) =>
      state != oldWidget.state;
}

abstract class ThemeSetter {
  void setTheme({required bool dark});
}
