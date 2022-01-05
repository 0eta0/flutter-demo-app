import 'package:demo_app/utils/pokemon_notifier.dart';
import 'package:demo_app/utils/thememode_notifier.dart';
import 'package:demo_app/utils/preferences.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/views/top_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final themeModeNotifier = ThemeModeNotifier(pref);
  final pokemonNotifier = PokemonNotifier();
  runApp(
    MultiProvider(
        providers: [
        ChangeNotifierProvider<ThemeModeNotifier>(
          create: (context) => themeModeNotifier,
        ),
        ChangeNotifierProvider<PokemonNotifier>(
          create: (context) => pokemonNotifier,
        ),
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    loadThemeMode(null).then((val) => setState(() => themeMode = val));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModeNotifier>(
      builder: (context, mode, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: mode.mode,
        home: const TopPage(),
    ));
  }
}