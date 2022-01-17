import 'package:demo_app/models/pokemon.dart';
import 'package:demo_app/pages/pokemon/detail/pokemon_detail_page.dart';
import 'package:demo_app/pages/pokemon/list/pokemon_list_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PokemonListPage extends HookConsumerWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(pokemonListStateControllerProvider.notifier);
    final list = ref.watch(pokemonListStateControllerProvider.select((value) => value.list));

    useEffect(() {
      controller.init();
    }, const []);

    return Scaffold(
      appBar: AppBar(
        // タイトルテキスト
        title: const Text('Pokemon'),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => PokeListItem(data: list[index])),
    );
  }
}

class PokeListItem extends StatelessWidget {
  const PokeListItem({Key? key, required this.data}) : super(key: key);
  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        data.imageUrl,
        height: 50,
        width: 50,
      ),
      title: Text(data.name),
      subtitle: Text(data.types[0]),
      onTap: () => {
        // TODO: Navigation
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => PokemonDetailPage(data: data),
          ),
        ),
      },
    );
  }
}

// import 'package:demo_app/consts/poke_api.dart';
// import 'package:demo_app/models/favorite_notifier.dart';
// import 'package:demo_app/pages/pokemon/list/item/pokemon_grid_item.dart';
// import 'package:demo_app/pages/pokemon/list/item/pokemon_list_item.dart';
// import 'package:demo_app/pages/bottom_sheet/viewmode_bottomsheet.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:demo_app/models/favorite.dart';
//
// class PokemonList extends StatefulWidget {
//   const PokemonList({Key? key}) : super(key: key);
//   @override
//   _PokeListState createState() => _PokeListState();
// }
//
// class _PokeListState extends State<PokemonList> {
//   static const int pageSize = 30;
//   bool isFavoriteMode = false;
//   bool isGridMode = true;
//   int _currentPage = 1;
//
//   bool isLastPage(int favsCount, int page) {
//     if (isFavoriteMode) {
//       if (_currentPage * pageSize < favsCount) {
//         return false;
//       }
//       return true;
//     } else {
//       if (_currentPage * pageSize < pokeMaxId) {
//         return false;
//       }
//       return true;
//     }
//   }
//
//   int itemCount(int count, int page) {
//     int ret = page * pageSize;
//     if (count < ret && isFavoriteMode) {
//       ret = count;
//     }
//     if (pokeMaxId < ret && !isFavoriteMode) {
//       ret = pokeMaxId;
//     }
//     return ret;
//   }
//
//   int itemId(List<Favorite> favs, int index) {
//     int ret = index + 1; // 通常モード
//     if (isFavoriteMode && index < favs.length) {
//       ret = favs[index].pokeId;
//     }
//     return ret;
//   }
//
//   void changeFavMode(bool currentMode) {
//     setState(() => isFavoriteMode = !currentMode);
//   }
//
//   void changeGridMode(bool currentMode) {
//     setState(() => isGridMode = !currentMode);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<FavoriteNotifier>(
//       builder: (context, favs, child) => Column(children: [
//         Container(
//           height: 40,
//           alignment: Alignment.topRight,
//           child: IconButton(
//             padding: const EdgeInsets.all(0),
//             icon: const Icon(Icons.auto_awesome_outlined),
//             onPressed: () async {
//               var ret = await showModalBottomSheet<bool>(
//                 context: context,
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 )),
//                 builder: (BuildContext context) {
//                   return ViewModeBottomSheet(
//                       favMode: isFavoriteMode,
//                       gridMode: isGridMode,
//                       changeFabMode: changeFavMode,
//                       changeGridMode: changeGridMode);
//                 },
//               );
//               if (ret != null && ret) {
//                 changeFavMode(isFavoriteMode);
//               }
//             },
//           ),
//         ),
//         Expanded(
//           child: Consumer<PokemonNotifier>(builder: (context, pokes, child) {
//             if (itemCount(favs.favs.length, _currentPage) == 0) {
//               return const Text("no data");
//             } else {
//               if (!isGridMode) {
//                 return ListView.builder(
//                   padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//                   itemCount: itemCount(favs.favs.length, _currentPage) + (isFavoriteMode ? 0 : 1),
//                   itemBuilder: (context, index) {
//                     if (index == itemCount(favs.favs.length, _currentPage)) {
//                       return OutlinedButton(
//                         child: const Text('more'),
//                         onPressed: isLastPage(favs.favs.length, _currentPage)
//                             ? null
//                             : () => {setState(() => _currentPage += 1)},
//                       );
//                     } else {
//                       return PokemonListItem(
//                         poke: pokes.byId(itemId(favs.favs, index)),
//                       );
//                     }
//                   },
//                 );
//               } else {
//                 return GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16),
//                     padding: const EdgeInsets.all(16),
//                     itemCount: itemCount(favs.favs.length, _currentPage) + (isFavoriteMode ? 0 : 1),
//                     itemBuilder: (context, index) {
//                       if (index == itemCount(favs.favs.length, _currentPage)) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 16),
//                           child: OutlinedButton(
//                             child: const Text('more'),
//                             style: OutlinedButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                             onPressed: isLastPage(favs.favs.length, _currentPage)
//                                 ? null
//                                 : () => {setState(() => _currentPage += 1)},
//                           ),
//                         );
//                       } else {
//                         return PokemonGridItem(
//                           poke: pokes.byId(itemId(favs.favs, index)),
//                         );
//                       }
//                     });
//               }
//             }
//           }),
//         ),
//       ]),
//     );
//   }
// }
