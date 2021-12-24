import 'package:flutter/material.dart';
import 'package:demo_app/views/poke_list.dart';
import 'package:demo_app/views/settings.dart';

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
        child: currentNb == 0 ? const PokeList() : const Settings(),
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