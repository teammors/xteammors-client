import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { dark, light, system }

@immutable
class ThemeViewModel {
  const ThemeViewModel();

  static const Color primary = Color(0xFF3E90C7);
  static const Color secondary = Color(0xFFC4CCD8);
  static const String cacheKey = 'app_theme_mode';

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
      case AppTheme.system:
        state?.setThemeMode(ThemeMode.system);
        break;
    }
    saveTheme(theme);
  }

  static Future<void> saveTheme(AppTheme theme) async {
    final p = await SharedPreferences.getInstance();
    switch (theme) {
      case AppTheme.dark:
        await p.setString(cacheKey, 'dark');
        break;
      case AppTheme.light:
        await p.setString(cacheKey, 'light');
        break;
      case AppTheme.system:
        await p.setString(cacheKey, 'system');
        break;
    }
  }

  static Future<AppTheme?> loadTheme() async {
    final p = await SharedPreferences.getInstance();
    final v = p.getString(cacheKey);
    if (v == null) return null;
    switch (v) {
      case 'dark':
        return AppTheme.dark;
      case 'light':
        return AppTheme.light;
      case 'system':
        return AppTheme.system;
      default:
        return AppTheme.light;
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
  void setThemeMode(ThemeMode mode);
}
