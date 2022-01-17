import 'package:demo_app/pages/pokemon/detail/pokemon_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/consts/poke_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PokemonGridItem extends StatelessWidget {
  const PokemonGridItem({Key? key, required this.poke}) : super(key: key);
  final Pokemon? poke;
  @override
  Widget build(BuildContext context) {
    if (poke != null) {
      return Column(
        children: [
          InkWell(
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PokemonDetailPage(data: poke),
                ),
              ),
            },
            child: Hero(
              tag: poke!.id,
              child: Container(
                height: MediaQuery.of(context).size.width / 3 - 48,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: (pokeTypeColors[poke!.types.first] ?? Colors.grey[100])?.withOpacity(.3),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: CachedNetworkImageProvider(
                      poke!.imageUrl,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            poke!.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      );
    } else {
      return const SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: Text('...'),
        ),
      );
    }
  }
}
