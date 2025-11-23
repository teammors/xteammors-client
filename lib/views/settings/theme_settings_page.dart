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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Settings')),
      body: ListView(
        children: [
          RadioListTile<AppTheme>(
            title: const Text('Dark'),
            value: AppTheme.dark,
            groupValue: _selected,
            onChanged: (v) {
              if (v == null) return;
              setState(() => _selected = v);
              widget.viewModel.applyTheme(context, v);
            },
          ),
          RadioListTile<AppTheme>(
            title: const Text('Light'),
            value: AppTheme.light,
            groupValue: _selected,
            onChanged: (v) {
              if (v == null) return;
              setState(() => _selected = v);
              widget.viewModel.applyTheme(context, v);
            },
          ),
        ],
      ),
    );
  }
}
