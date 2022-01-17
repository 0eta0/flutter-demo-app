import 'package:demo_app/pages/pokemon/list/pokemon_list_page.dart';
import 'package:demo_app/pages/settings/settings.dart';
import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  TopPageState createState() => TopPageState();
}

class TopPageState extends State<TopPage> {
  int currentNb = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          children: const [PokemonList(), Settings()],
          index: currentNb
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(
            () => currentNb = index,
          )
        },
        currentIndex: currentNb,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "settings",
          )
        ],
      ),
    );
  }
}