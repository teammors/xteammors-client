import 'package:flutter/material.dart';
import '../../viewmodels/theme_viewmodel.dart';

class ThemeSettingsPage extends StatefulWidget {
  final ThemeViewModel viewModel;
  const ThemeSettingsPage({super.key, this.viewModel = const ThemeViewModel()});

  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  AppTheme _selected = AppTheme.dark;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final t = await ThemeViewModel.loadTheme();
    if (t != null) {
      setState(() => _selected = t);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Settings')),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              children: [
                RadioListTile<AppTheme>(
                  title: const Text('Dark'),
                  value: AppTheme.dark,
                  groupValue: _selected,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _selected = v);
                    widget.viewModel.applyTheme(context, v);
                  },
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.08),
                ),
                RadioListTile<AppTheme>(
                  title: const Text('Light'),
                  value: AppTheme.light,
                  groupValue: _selected,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _selected = v);
                    widget.viewModel.applyTheme(context, v);
                  },
                ),
                Divider(
                  height: 0,
                  thickness: 0.5,
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.08),
                ),
                RadioListTile<AppTheme>(
                  title: const Text('System'),
                  value: AppTheme.system,
                  groupValue: _selected,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _selected = v);
                    widget.viewModel.applyTheme(context, v);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
