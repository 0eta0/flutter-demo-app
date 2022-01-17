import 'package:demo_app/models/favorite.dart';
import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/consts/poke_colors.dart';
import 'package:demo_app/models/favorite_notifier.dart';
import 'package:demo_app/pages/pokemon/detail/pokemon_detail_state_controller.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonDetailPage extends HookConsumerWidget {
  const PokemonDetailPage({Key? key, this.data }) : super(key: key);
  final Pokemon? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(overrides: [
      pokemonStateControllerProvider.overrideWithProvider(pokemonStateControllerProviderFamily(data!))
    ], child: PokemonItem());
  }
}

class PokemonItem extends HookConsumerWidget {
  const PokemonItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pokemonStateControllerProvider.select((value) => value.data))!;

    return Scaffold(
      body: Container(
          color: (pokeTypeColors[data.types.first] ?? Colors.grey[100])?.withOpacity(.5),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  // trailing: IconButton(
                  //   icon: favs.isExist(data.id)
                  //     ? const Icon(Icons.star, color: Colors.orangeAccent)
                  //     : const Icon(Icons.star_outline),
                  //   onPressed: () => {
                  //     favs.toggle(Favorite(pokeId: data.id))
                  //   },
                  // ),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 280,
                        width: 280,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(180),
                          color: Colors.white.withOpacity(.5),
                        ),
                      ),
                    ),
                    Hero(
                      tag: data.id,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        child: CachedNetworkImage(
                          imageUrl: data.imageUrl,
                          height: 250,
                          width: 250,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.white.withOpacity(.5),
                  ),
                  child: Text(
                    '#${data.id.toString().padLeft(3, "0")}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '${data.name.substring(0, 1).toUpperCase()}${data.name.substring(1)}',
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: data.types.map(
                    (type) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Chip(
                        backgroundColor: pokeTypeColors[type] ?? Colors.grey,
                        label: Text(
                          type,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (pokeTypeColors[type] ?? Colors.grey).computeLuminance() > 0.5
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                    )
                  ).toList()
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
    );
  }
}
