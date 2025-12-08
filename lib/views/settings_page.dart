import 'package:flutter/material.dart';
import '../viewmodels/settings_viewmodel.dart';
import 'settings/theme_settings_page.dart';
import '../utils/toast_utils.dart';
import 'user_profile_page.dart';

class SettingsPage extends StatelessWidget {
  final SettingsViewModel viewModel;
  final VoidCallback? onOpenThemeSettings;
  final VoidCallback? onOpenSecurityPrivacy;
  final VoidCallback? onOpenAccountManagement;
  final VoidCallback? onOpenMyAIBot;
  final VoidCallback? onOpenFollowedRobots;
  final VoidCallback? onOpenFavorites;
  final VoidCallback? onOpenFiles;
  final VoidCallback? onOpenNotifications;
  final VoidCallback? onOpenLanguage;
  final VoidCallback? onOpenHelpSupport;
  final VoidCallback? onOpenAbout;
  final VoidCallback? onOpenUserProfile;
  const SettingsPage({
    super.key,
    this.viewModel = const SettingsViewModel(),
    this.onOpenThemeSettings,
    this.onOpenSecurityPrivacy,
    this.onOpenAccountManagement,
    this.onOpenMyAIBot,
    this.onOpenFollowedRobots,
    this.onOpenFavorites,
    this.onOpenFiles,
    this.onOpenNotifications,
    this.onOpenLanguage,
    this.onOpenHelpSupport,
    this.onOpenAbout,
    this.onOpenUserProfile,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.08),
                border: Border(
                  bottom: BorderSide(
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.1),
                    width: 0.5,
                  ),
                ),
              ),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (onOpenUserProfile != null) {
                onOpenUserProfile!.call();
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const UserProfilePage()),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: const [
                  CircleAvatar(radius: 32),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nickname',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('User subtitle'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                children: [
                  _SettingsItem(
                    icon: Icons.color_lens_outlined,
                    title: 'Theme Settings',
                    subtitle: 'Switch between dark and light themes',
                    onTap: () {
                      if (onOpenThemeSettings != null) {
                        onOpenThemeSettings!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => const ThemeSettingsPage()),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.lock_outline,
                    title: 'Security & Privacy',
                    subtitle: 'Manage permissions, encryption and safety',
                    onTap: () {
                      if (onOpenSecurityPrivacy != null) {
                        onOpenSecurityPrivacy!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'Security & Privacy',
                              description:
                                  'Manage permissions, encryption and safety.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.manage_accounts_outlined,
                    title: 'Account Management',
                    subtitle: 'Profile, login and linked devices',
                    onTap: () {
                      if (onOpenAccountManagement != null) {
                        onOpenAccountManagement!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'Account Management',
                              description: 'Profile, login and linked devices.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.smart_toy_outlined,
                    title: 'My AI Bot',
                    subtitle: 'Configure AI assistant preferences',
                    onTap: () {
                      if (onOpenMyAIBot != null) {
                        onOpenMyAIBot!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'My AI Bot',
                              description:
                                  'Configure AI assistant preferences.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.center_focus_strong_outlined,
                    title: 'The Robots I Follow',
                    subtitle: 'View the robots I follow',
                    onTap: () {
                      if (onOpenFollowedRobots != null) {
                        onOpenFollowedRobots!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'The Robots I Follow',
                              description: 'View the robots I follow.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.favorite_outline,
                    title: 'Favorites',
                    subtitle: 'Manage favorite messages',
                    onTap: () {
                      if (onOpenFavorites != null) {
                        onOpenFavorites!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'Favorites',
                              description: 'Manage favorite messages.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.file_copy_outlined,
                    title: 'Files',
                    subtitle: 'Files for managing messages',
                    onTap: () {
                      if (onOpenFiles != null) {
                        onOpenFiles!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'Files',
                              description: 'Files for managing messages.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.notifications_outlined,
                    title: 'Notifications',
                    subtitle: 'Notification preferences',
                    onTap: () {
                      if (onOpenNotifications != null) {
                        onOpenNotifications!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'Notifications',
                              description: 'Notification preferences.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.language,
                    title: 'Language',
                    subtitle: 'App language',
                    onTap: () {
                      if (onOpenLanguage != null) {
                        onOpenLanguage!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'Language',
                              description: 'App language.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.help_outline,
                    title: 'Help & Support',
                    subtitle: 'Get help and support',
                    onTap: () {
                      if (onOpenHelpSupport != null) {
                        onOpenHelpSupport!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'Help & Support',
                              description: 'Get help and support.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    indent: 50,
                    endIndent: 0,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.2),
                  ),
                  _SettingsItem(
                    icon: Icons.info_outline,
                    title: 'About',
                    subtitle: 'Version info and acknowledgements',
                    onTap: () {
                      if (onOpenAbout != null) {
                        onOpenAbout!.call();
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SettingsDetailPage(
                              title: 'About',
                              description: 'Version info and acknowledgements.',
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  State<_SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<_SettingsItem> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 80,
          color:
              _hover ? cs.primary.withValues(alpha: 0.06) : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(widget.icon, color: cs.onSurfaceVariant),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: cs.onSurface)),
                    const SizedBox(height: 4),
                    Text(widget.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsDetailPage extends StatelessWidget {
  final String title;
  final String description;
  const SettingsDetailPage(
      {super.key, required this.title, required this.description});
  const SettingsDetailPage.sample({super.key})
      : title = 'Settings Detail',
        description = 'Detail page placeholder.';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: cs.onSurface)),
            const SizedBox(height: 8),
            Text(description,
                style: TextStyle(fontSize: 14, color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
