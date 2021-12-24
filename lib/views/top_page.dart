import 'package:flutter/material.dart';
import 'package:demo_app/list_components/poke_list_item.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10000,
        itemBuilder: (context, index) => PokeListItem(index: index)
      ),
    );
  }
}
