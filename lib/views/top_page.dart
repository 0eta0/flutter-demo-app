import 'package:flutter/material.dart';
import 'package:demo_app/list_components/poke_list_item.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          itemCount: 898,
          itemBuilder: (context, index) => PokeListItem(index: index)
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {},
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
