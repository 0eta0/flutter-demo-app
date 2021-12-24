import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          leading: Icon(Icons.lightbulb),
          title: Text("Dark/Light Mode"),
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