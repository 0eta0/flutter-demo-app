import 'package:flutter/material.dart';
import 'package:demo_app/views/pokemon/pokemon_detail_page.dart';
import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/consts/poke_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.poke}) : super(key: key);
  final Pokemon? poke;
  @override
  Widget build(BuildContext context) {
    if (poke != null) {
      return ListTile(
        leading: Hero(
          tag: poke!.id,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: (pokeTypeColors[poke!.types.first] ?? Colors.grey[100])?.withOpacity(.3),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: CachedNetworkImageProvider(
                  poke!.imageUrl,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          poke!.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
        ),
        subtitle: Text(
          poke!.types.first,
        ),
        trailing: const Icon(Icons.navigate_next),
        onTap: () => {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => PokeDetail(poke: poke!),
            ),
          ),
        },
      );
    } else {
      return const ListTile(title: Text('...'));
    }
  }
}