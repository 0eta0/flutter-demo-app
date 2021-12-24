import 'package:flutter/material.dart';
import 'package:demo_app/views/settings/theme/theme_mode.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text("Dark/Light Mode"),
          onTap: () => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ThemeModeSelectionPage(),
            )),
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