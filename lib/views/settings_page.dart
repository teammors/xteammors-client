import 'package:flutter/material.dart';
import '../viewmodels/settings_viewmodel.dart';
import 'settings/theme_settings_page.dart';

class SettingsPage extends StatelessWidget {
  final SettingsViewModel viewModel;
  final VoidCallback? onOpenThemeSettings;
  const SettingsPage({
    super.key,
    this.viewModel = const SettingsViewModel(),
    this.onOpenThemeSettings,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              height: 56,
              color: Colors.white,
            ),),
          Padding(
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
          SizedBox(
            height: 80,
            child: ListTile(
              leading: const Icon(Icons.color_lens_outlined),
              title: const Text('Theme Settings'),
              subtitle: const Text('Switch between dark and light themes'),
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
          ),
          // Divider(
          //   height: 1,
          //   thickness: 0.5,
          //   indent: 20,
          //   endIndent: 0,
          //   color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
          // ),
          const SizedBox(
            height: 80,
            child: ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('Security & Privacy'),
              subtitle: Text('Manage permissions, encryption and safety'),
            ),
          ),
          // Divider(
          //   height: 1,
          //   thickness: 0.5,
          //   indent: 20,
          //   endIndent: 0,
          //   color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
          // ),
          const SizedBox(
            height: 80,
            child: ListTile(
              leading: Icon(Icons.manage_accounts_outlined),
              title: Text('Account Management'),
              subtitle: Text('Profile, login and linked devices'),
            ),
          ),
          // Divider(
          //   height: 1,
          //   thickness: 0.5,
          //   indent: 20,
          //   endIndent: 0,
          //   color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
          // ),
          const SizedBox(
            height: 80,
            child: ListTile(
              leading: Icon(Icons.smart_toy_outlined),
              title: Text('My AI Bot'),
              subtitle: Text('Configure AI assistant preferences'),
            ),
          ),
          // Divider(
          //   height: 1,
          //   thickness: 0.5,
          //   indent: 20,
          //   endIndent: 0,
          //   color: Theme.of(context).dividerColor.withValues(alpha: 0.5),
          // ),
          const SizedBox(
            height: 80,
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About'),
              subtitle: Text('Version info and acknowledgements'),
            ),
          ),
        ],
      ),
    );
  }
}
