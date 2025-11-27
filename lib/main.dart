import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'views/messages_page.dart';
import 'views/contacts_page.dart';
import 'views/ai_page.dart';
import 'views/settings_page.dart';
import 'views/workspace_blank.dart';
import 'views/chat_page.dart';
import 'viewmodels/chat_viewmodel.dart';
import 'views/settings/theme_settings_page.dart';
import 'viewmodels/theme_viewmodel.dart';

void main() {
  runApp(const XteammorsApp());
}

class XteammorsApp extends StatefulWidget {
  const XteammorsApp({super.key});

  @override
  State<XteammorsApp> createState() => _XteammorsAppState();
}

class _XteammorsAppState extends State<XteammorsApp> implements ThemeSetter {
  final _themeVM = const ThemeViewModel();
  bool _dark = false;

  @override
  void initState() {
    super.initState();
    _bootstrapTheme();
  }

  Future<void> _bootstrapTheme() async {
    final t = await ThemeViewModel.loadTheme();
    if (t != null) {
      setState(() {
        _dark = t == AppTheme.dark;
      });
    }
  }

  @override
  void setTheme({required bool dark}) {
    setState(() {
      _dark = dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppStateScope(
      state: this,
      child: MaterialApp(
        title: 'Xteammors',
        debugShowCheckedModeBanner: false,
        theme: _themeVM.lightTheme.copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        darkTheme: _themeVM.darkTheme.copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[900],
            foregroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
        home: const MainShell(),
      ),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  double _split = 0.3;
  static const double _minSplit = 0.3;
  static const double _maxSplit = 0.5;
  Widget _rightPane = const WorkspaceBlank();

  Widget _pageForIndex(int index) {
    switch (index) {
      case 0:
        return MessagesPage(
          onOpenChat: _isDesktop
              ? (summary) => setState(
                () => _rightPane =
                ChatPage(viewModel: ChatViewModel.fromSummary(summary)),
          )
              : null,
        );
      case 1:
        return const ContactsPage();
      case 2:
        return const AIPage();
      case 3:
        return SettingsPage(
          onOpenThemeSettings: _isDesktop
              ? () => setState(() => _rightPane = const ThemeSettingsPage())
              : null,
        );
      default:
        return const MessagesPage();
    }
  }

  final List<String> _titles = const ['Messages', 'Contacts', 'AI', 'Settings'];

  bool get _isDesktop {
    if (kIsWeb) return true;
    return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (_isDesktop) {
      const dividerWidth = 0.5;
      return LayoutBuilder(
        builder: (context, constraints) {
          final total = constraints.maxWidth;
          final leftWidth = (total - dividerWidth) * _split;
          final rightWidth = total - dividerWidth - leftWidth;
          return Row(
            children: [
              SizedBox(
                width: leftWidth,
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: false,
                    backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                    foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
                    title: Text(
                      _titles[_selectedIndex],
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                    ),
                  ),
                  body: _pageForIndex(_selectedIndex),
                  bottomNavigationBar: NavigationBarTheme(
                    data: NavigationBarThemeData(
                      height: 50,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: 0.08),
                      indicatorColor: isDark
                          ? Colors.white.withValues(alpha: 0.3)
                          : Theme.of(context)
                          .colorScheme
                          .outline
                          .withValues(alpha: 0.5),
                      iconTheme: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return IconThemeData(
                              color: isDark
                                  ? Colors.white
                                  : Colors.white);
                        }
                        return IconThemeData(
                            color:
                            isDark ? Colors.grey[500] : Colors.grey[700]);
                      }),
                    ),
                    child: NavigationBar(
                      labelBehavior:
                      NavigationDestinationLabelBehavior.alwaysHide,
                      selectedIndex: _selectedIndex,
                      destinations: const [
                        NavigationDestination(
                            icon: Icon(
                              Icons.chat_bubble_outline,
                            ),
                            label: ''),
                        NavigationDestination(
                            icon: Icon(Icons.people_outline), label: ''),
                        NavigationDestination(
                            icon: Icon(Icons.smart_toy_outlined), label: ''),
                        NavigationDestination(
                            icon: Icon(Icons.settings_outlined), label: ''),
                      ],
                      onDestinationSelected: (index) {
                        setState(() {
                          _selectedIndex = index;
                          _rightPane = const WorkspaceBlank();
                        });
                      },
                    ),
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragUpdate: (details) {
                  final newSplit = (_split + details.delta.dx / total).clamp(
                    _minSplit,
                    _maxSplit,
                  );
                  setState(() {
                    _split = newSplit;
                  });
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeColumn,
                  child: SizedBox(
                    width: dividerWidth,
                    child: VerticalDivider(
                      width: dividerWidth,
                      thickness: 1,
                      color: Theme.of(context)
                          .colorScheme
                          .outlineVariant
                          .withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: rightWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: _rightPane,
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: Text(
          _titles[_selectedIndex],
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: _pageForIndex(_selectedIndex),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 56,
          backgroundColor:
          Theme.of(context).colorScheme.surfaceContainerHighest,
          indicatorColor: isDark
              ? Colors.white.withValues(alpha: 0.18)
              : Colors.black.withValues(alpha: 0.08),
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return IconThemeData(
                  color: isDark
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary);
            }
            return IconThemeData(
                color: isDark ? Colors.grey[500] : Colors.grey[700]);
          }),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _selectedIndex,
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline), label: ''),
            NavigationDestination(icon: Icon(Icons.people_outline), label: ''),
            NavigationDestination(
                icon: Icon(Icons.smart_toy_outlined), label: ''),
            NavigationDestination(
                icon: Icon(Icons.settings_outlined), label: ''),
          ],
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
              _rightPane = const WorkspaceBlank();
            });
          },
        ),
      ),
    );
  }
}