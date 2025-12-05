import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:window_manager/window_manager.dart';
import 'package:provider/provider.dart';
import 'package:xteammors/utils/camera_delegate.dart';

import 'views/messages_page.dart';
import 'views/contacts_page.dart';
import 'views/ai_page.dart';
import 'views/settings_page.dart';
import 'views/workspace_blank.dart';
import 'views/chat_page.dart';
import 'viewmodels/chat_viewmodel.dart';
import 'views/settings/theme_settings_page.dart';
import 'viewmodels/theme_viewmodel.dart';
import 'views/user_profile_page.dart';
import 'viewmodels/user_profile_viewmodel.dart';
import 'viewmodels/contacts_viewmodel.dart';
import 'data/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initCamera();
  runApp(const XteammorsApp());

  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    await windowManager.ensureInitialized();
    final options = WindowOptions(
      size: const Size(1200, 800),
      minimumSize: const Size(1200, 800),
      center: true,
      title: 'Xteammors',
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(options, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}

void initCamera() {
  if (Platform.isWindows) {
    /// Add camera support to Image Picker on Windows.
    WindowsCameraDelegate.register();
  }
}

class XteammorsApp extends StatefulWidget {
  const XteammorsApp({super.key});

  @override
  State<XteammorsApp> createState() => _XteammorsAppState();
}

class _XteammorsAppState extends State<XteammorsApp> implements ThemeSetter {
  final _themeVM = const ThemeViewModel();
  bool _dark = false;
  late final AppDatabase _db;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase.makeDefault();
    _prepareDb();
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

  Future<void> _prepareDb() async {
    try {
      await _db.customStatement('SELECT 1');
    } catch (_) {}
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
      child: Provider<AppDatabase>.value(
        value: _db,
        child: MaterialApp(
          title: 'Xteammors',
          debugShowCheckedModeBanner: false,
          theme: _themeVM.lightTheme.copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              shape: const Border(
                bottom: BorderSide(color: Color(0x1F000000), width: 0.5),
              ),
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
              shape: const Border(
                bottom: BorderSide(color: Color(0x1FFFFFFF), width: 0.5),
              ),
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
        return ContactsPage(
          onOpenProfile: _isDesktop
              ? (contact) => setState(() {
                    _rightPane = UserProfilePage(
                      vm: UserProfileViewModel(
                        userId: contact.id,
                        name: contact.name,
                        avatarUrl: contact.avatarUrl,
                        bio: '这个人很神秘，什么都没有留下',
                        online: contact.online,
                        sharedGroups: const [
                          GroupSummary(
                              id: 'g1', name: 'Flutter Devs', members: 128),
                          GroupSummary(
                              id: 'g2', name: 'Design Weekly', members: 42),
                          GroupSummary(
                              id: 'g3', name: 'Project X Team', members: 16),
                        ],
                      ),
                    );
                  })
              : null,
        );
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

  // 自定义标题栏
  Widget _buildTitleBar() {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.2),
            width: 0.8,
          ),
        ),
      ),
      child: Row(
        children: [
          // const SizedBox(width: 12),
          // macOS 风格的窗口控制按钮
          // if (Platform.isMacOS) ...[
          //   WindowButtons(),
          //   const Spacer(),
          // ],
          // 应用标题
          Expanded(
            child: MoveWindow(
              child: Center(
                child: Text(
                  "xTeammors",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
          ),
          // Windows/Linux 风格的窗口控制按钮
          // if (!Platform.isMacOS) ...[
          //   const Spacer(),
          //   // WindowButtons(),
          // ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_isDesktop) {
      const dividerWidth = 0.5;
      return WindowBorder(
        color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
        width: 1,
        child: Material(
          child: Column(
            children: [
              // 自定义标题栏
              _buildTitleBar(),
              // 窗口内容
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final total = constraints.maxWidth;
                    final leftWidth = (total - dividerWidth) * _split;
                    final rightWidth = total - dividerWidth - leftWidth;
                    return Row(
                      children: [
                        SizedBox(
                          width: leftWidth,
                          child: Scaffold(
                            appBar: null, // 移除原来的 AppBar
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
                                iconTheme:
                                    MaterialStateProperty.resolveWith((states) {
                                  if (states.contains(MaterialState.selected)) {
                                    return IconThemeData(
                                        color: isDark
                                            ? Colors.white
                                            : Colors.white);
                                  }
                                  return IconThemeData(
                                      color: isDark
                                          ? Colors.grey[500]
                                          : Colors.grey[700]);
                                }),
                              ),
                              child: NavigationBar(
                                labelBehavior:
                                    NavigationDestinationLabelBehavior
                                        .alwaysHide,
                                selectedIndex: _selectedIndex,
                                destinations: const [
                                  NavigationDestination(
                                      icon: Icon(
                                        Icons.chat_bubble_outline,
                                      ),
                                      label: ''),
                                  NavigationDestination(
                                      icon: Icon(Icons.people_outline),
                                      label: ''),
                                  NavigationDestination(
                                      icon: Icon(Icons.smart_toy_outlined),
                                      label: ''),
                                  NavigationDestination(
                                      icon: Icon(Icons.settings_outlined),
                                      label: ''),
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
                            final newSplit =
                                (_split + details.delta.dx / total).clamp(
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
                ),
              ),
            ],
          ),
        ),
      );
    }

    // 移动端布局保持不变
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

// 窗口控制按钮组件
// class WindowButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//
//     return Row(
//       children: [
//         if (Platform.isMacOS) ...[
//           // macOS 风格的按钮 (红黄绿)
//           _MacWindowButton(
//             color: Colors.red.shade400,
//             onPressed: appWindow.close,
//           ),
//           const SizedBox(width: 8),
//           _MacWindowButton(
//             color: Colors.orange.shade400,
//             onPressed: appWindow.minimize,
//           ),
//           const SizedBox(width: 8),
//           _MacWindowButton(
//             color: Colors.green.shade400,
//             onPressed: appWindow.maximizeOrRestore,
//           ),
//         ] else ...
//         [
//           // Windows/Linux 风格的按钮
//           MinimizeWindowButton(
//             colors: WindowButtonColors(
//               iconNormal: isDark ? Colors.white : Colors.black,
//               iconMouseDown: isDark ? Colors.white : Colors.black,
//               iconMouseOver: isDark ? Colors.white : Colors.black,
//               normal: Colors.transparent,
//               mouseOver: isDark ? Colors.grey[800] : Colors.grey[300],
//               mouseDown: isDark ? Colors.grey[700] : Colors.grey[400],
//             ),
//           ),
//           MaximizeWindowButton(
//             colors: WindowButtonColors(
//               iconNormal: isDark ? Colors.white : Colors.black,
//               iconMouseDown: isDark ? Colors.white : Colors.black,
//               iconMouseOver: isDark ? Colors.white : Colors.black,
//               normal: Colors.transparent,
//               mouseOver: isDark ? Colors.grey[800] : Colors.grey[300],
//               mouseDown: isDark ? Colors.grey[700] : Colors.grey[400],
//             ),
//           ),
//           CloseWindowButton(
//             colors: WindowButtonColors(
//               iconNormal: isDark ? Colors.white : Colors.black,
//               iconMouseDown: Colors.white,
//               iconMouseOver: Colors.white,
//               normal: Colors.transparent,
//               mouseOver: Colors.red,
//               mouseDown: Colors.red.shade700,
//             ),
//           ),
//         ],
//       ],
//     );
//   }
// }

// macOS 风格窗口按钮
class _MacWindowButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const _MacWindowButton({
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
