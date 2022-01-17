import 'package:demo_app/pages/settings/theme/theme_mode.dart';
import 'package:demo_app/pages/settings/theme/theme_mode_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/utils/preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeStateControllerProvider.select((value) => value.themeMode));
    final theme = ref.watch(themeModeStateControllerProvider.notifier);

    return ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.lightbulb),
            title: const Text("Dark/Light Mode"),
            trailing: Text(
              (themeMode == ThemeMode.system)
              ? "System"
              : (themeMode == ThemeMode.light) ? "Light" : "Dark"
            ),
            onTap: () async {
              var newMode = await Navigator.of(context).push<ThemeMode>(
                MaterialPageRoute(
                  builder: (context) => ThemeModeSelectionPage(mode: themeMode),
                ),
              );
              if (newMode != null) {
                theme.update(newMode);
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
    );
  }
}