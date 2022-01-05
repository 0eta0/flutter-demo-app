import 'package:flutter/material.dart';
import 'package:demo_app/views/settings/theme/theme_mode.dart';
import 'package:demo_app/utils/preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadThemeMode().then((val) => setState(() => _themeMode = val));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          trailing: Text(
            (_themeMode == ThemeMode.system)
            ? "System"
            : (_themeMode == ThemeMode.light) ? "Light" : "Dark"
          ),
          onTap: () async {
            var mode = await Navigator.of(context).push<ThemeMode>(
              MaterialPageRoute(
                builder: (context) => ThemeModeSelectionPage(mode: _themeMode),
              ),
            );
            setState(() => _themeMode = mode!);
            await saveThemeMode(_themeMode);
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
    );
  }
}