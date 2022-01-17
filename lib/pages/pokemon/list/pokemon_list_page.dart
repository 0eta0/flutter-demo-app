import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/pages/bottom_sheet/viewmode_bottomsheet.dart';
import 'package:demo_app/pages/pokemon/detail/pokemon_detail_page.dart';
import 'package:demo_app/pages/pokemon/list/item/pokemon_list_item.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'item/pokemon_grid_item.dart';

class PokemonListPage extends HookConsumerWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(pokemonListStateControllerProvider.notifier);
    final list = ref.watch(pokemonListStateControllerProvider.select((value) => value.list));
    final mode = ref.watch(displayModeStateControllerProvider);

    useEffect(() {
      controller.init();
    }, const []);

    return Scaffold(
      appBar: AppBar(
        // タイトルテキスト
        title: const Text('Pokemon List'),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.auto_awesome_outlined),
            onPressed: () async {
              showModalBottomSheet<bool>(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                builder: (BuildContext context) {
                  return ViewModeBottomSheet(gridMode: mode == DisplayMode.grid);
                },
              );
            },
          ),
        ],
      ),
      body: mode == DisplayMode.list
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (list.length <= index) {
                  return OutlinedButton(
                    onPressed: () {  },
                    child: const Text('more'),);
                } else {
                  return PokemonListItem(poke: list[index]);
                }
              },
            )
          : GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16),
              padding: const EdgeInsets.all(16),
              itemCount: list.length + 1,
              itemBuilder: (context, index) {
                if (list.length <= index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: OutlinedButton(
                      child: const Text('more'),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () { },
                    ),
                  );
                } else {
                  return PokemonGridItem(
                    poke: list[index],
                  );
                }
              }
          )
    );
  }
}
