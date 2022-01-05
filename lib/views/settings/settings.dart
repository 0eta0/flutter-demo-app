import 'package:flutter/material.dart';
import 'package:demo_app/views/settings/theme/theme_mode.dart';
import 'package:demo_app/utils/preferences.dart';
import 'package:demo_app/utils/thememode_notifier.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, mode, child) => ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text("Dark/Light Mode"),
            trailing: Text(
              (mode.mode == ThemeMode.system)
              ? "System"
              : (mode.mode == ThemeMode.light) ? "Light" : "Dark"
            ),
            onTap: () async {
              var newMode = await Navigator.of(context).push<ThemeMode>(
                MaterialPageRoute(
                  builder: (context) => ThemeModeSelectionPage(mode: mode.mode),
                ),
              );
              if (newMode != null) {
                mode.update(newMode);
              }
            },
          ),
          SwitchListTile(
            title: const Text("Switch"),
            value: true,
            onChanged: (yes) => {}
          ),
          CheckboxListTile(
            title: const Text("Checkbox"),
            value: true,
            onChanged: (yes) => {}
          ),
          RadioListTile(
            title: const Text("Radio"),
            value: true,
            groupValue: true,
            onChanged: (yes) => {},
          ),
        ],
    ));
  }
}