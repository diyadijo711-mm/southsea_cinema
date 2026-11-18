import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const SettingsScreen({
    super.key,
    required this.themeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Light mode'),
            value: themeMode == ThemeMode.light,
            onChanged: (bool isLightMode) {
              onThemeModeChanged(
                isLightMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ],
      ),
    );
  }
}
