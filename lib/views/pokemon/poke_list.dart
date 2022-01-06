import 'package:demo_app/consts/poke_api.dart';
import 'package:demo_app/objects/favorite_notifier.dart';
import 'package:demo_app/objects/pokemon_notifier.dart';
import 'package:demo_app/views/bottom_sheet/viewmode_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/views/pokemon/poke_list_item.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/objects/favorite_model.dart';
import 'package:demo_app/views/pokemon/poke_grid_item.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);
    @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int pageSize = 30;
  bool isFavoriteMode = false;
  bool isGridMode = true;
  int _currentPage = 1;

  bool isLastPage(int favsCount, int page) {
    if (isFavoriteMode) {
      if (_currentPage * pageSize < favsCount) {
        return false;
      }
      return true;
    } else {
      if (_currentPage * pageSize < pokeMaxId) {
        return false;
      }
      return true;
    }
  }

  int itemCount(int count, int page) {
    int ret = page * pageSize;
    if (count < ret && isFavoriteMode) {
      ret = count;
    }
    if (pokeMaxId < ret && !isFavoriteMode) {
      ret = pokeMaxId;
    }
    return ret;
  }

  int itemId(List<Favorite> favs, int index) {
    int ret = index + 1; // 通常モード
    if (isFavoriteMode && index < favs.length) {
      ret = favs[index].pokeId;
    }
    return ret;
  }

  void changeFavMode(bool currentMode) {
    setState(() => isFavoriteMode = !currentMode);
  }

  void changeGridMode(bool currentMode) {
    setState(() => isGridMode = !currentMode);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteNotifier>(
      builder: (context, favs, child) => Column(
      children: [
        Container(
          height: 40,
          alignment: Alignment.topRight,
          child: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(Icons.auto_awesome_outlined),
            onPressed: () async {
              var ret = await showModalBottomSheet<bool>(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                ),
                builder: (BuildContext context) {
                  return ViewModeBottomSheet(favMode: isFavoriteMode, gridMode: isGridMode, changeFabMode: changeFavMode, changeGridMode: changeGridMode);
                },
              );
              if (ret != null && ret) {
                changeFavMode(isFavoriteMode);
              }
            },
          ),
        ),
        Expanded(
          child: Consumer<PokemonNotifier>(
            builder: (context, pokes, child) {
              if (itemCount(favs.favs.length, _currentPage) == 0) {
                return const Text("no data");
              } else {
                if (!isGridMode) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    itemCount: itemCount(favs.favs.length, _currentPage) + (isFavoriteMode ? 0 : 1),
                    itemBuilder: (context, index) {
                      if (index == itemCount(favs.favs.length, _currentPage)) {
                        return OutlinedButton(
                          child: const Text('more'),
                          onPressed: isLastPage(favs.favs.length, _currentPage)
                            ? null
                            : () => { setState(() => _currentPage += 1) },
                        );
                      } else {
                        return PokeListItem(
                          poke: pokes.byId(itemId(favs.favs, index)),
                        );
                      }
                    },
                  );
                } else {
                  return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: itemCount(favs.favs.length, _currentPage) + (isFavoriteMode ? 0 : 1),
                    itemBuilder: (context, index) {
                      if (index == itemCount(favs.favs.length, _currentPage)) {
                        return Padding(
                          padding: const EdgeInsets.all(0),
                          child: OutlinedButton(
                            child: const Text('more'),
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed:
                                isLastPage(favs.favs.length, _currentPage)
                                  ? null
                                  : () => { setState(() => _currentPage+= 1) },
                          ),
                        );
                      } else {
                        return PokeGridItem(
                          poke: pokes.byId(itemId(favs.favs, index)),
                        );
                      }
                    });
                }
              }
            }
          ),
        ),
      ]),
    );
  }
}