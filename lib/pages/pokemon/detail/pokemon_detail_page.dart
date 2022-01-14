import 'package:demo_app/models/favorite.dart';
import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/consts/poke_colors.dart';
import 'package:demo_app/models/favorite_notifier.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonDetailPage extends HookConsumerWidget {
  const PokemonDetailPage({Key? key, })
  final Pokemon? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(overrides: [
      pokemonListStateControllerProvider.overrideWithProvider(pokemonListStateControllerProviderFamily(data!))
    ], child: PokemonList)
  }
}

class PokemonDetailPage2 extends StatelessWidget {
  const PokemonDetailPage({Key? key, required this.poke}) : super(key: key);

  final Pokemon poke;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteNotifier>(
      builder: (context, favs, child) => Scaffold(
        body: Container(
          color: (pokeTypeColors[poke.types.first] ?? Colors.grey[100])?.withOpacity(.5),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  trailing: IconButton(
                    icon: favs.isExist(poke.id)
                      ? const Icon(Icons.star, color: Colors.orangeAccent)
                      : const Icon(Icons.star_outline),
                    onPressed: () => {
                      favs.toggle(Favorite(pokeId: poke.id))
                    },
                  ),
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
                      tag: poke.id,
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        child: CachedNetworkImage(
                          imageUrl: poke.imageUrl,
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
                    '#${poke.id.toString().padLeft(3, "0")}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '${poke.name.substring(0, 1).toUpperCase()}${poke.name.substring(1)}',
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: poke.types.map(
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
      ),
    );
  }
}
