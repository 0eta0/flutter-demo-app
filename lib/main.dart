import 'package:demo_app/models/favorite_notifier.dart';
import 'package:demo_app/pages/settings/theme/theme_mode_state_controller.dart';
import 'package:demo_app/pages/top_page.dart';
import 'package:demo_app/models/thememode_notifier.dart';
import 'package:demo_app/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeStateControllerProvider);
    return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: theme.themeMode,
          home: const TopPage(),
        );
  }
}
