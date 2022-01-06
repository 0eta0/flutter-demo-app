import 'package:demo_app/objects/favorite_model.dart';
import 'package:demo_app/objects/pokemon_model.dart';
import 'package:demo_app/consts/poke_colors.dart';
import 'package:demo_app/utils/favorite_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokeDetail extends StatelessWidget {
  const PokeDetail({Key? key, required this.poke}) : super(key: key);
  final Pokemon poke;
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteNotifier>(
      builder: (context, favs, child) => Scaffold(
        body: SafeArea(
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
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    child: Image.network(
                      poke.imageUrl,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Text(
                    "No.${poke.id}",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                poke.name,
                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
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
                          color: (pokeTypeColors[type] ?? Colors.grey)
                                      .computeLuminance() >
                                  0.5
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
