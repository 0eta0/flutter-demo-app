import 'package:demo_app/consts/poke_api.dart';
import 'package:demo_app/utils/favorite_notifier.dart';
import 'package:demo_app/utils/pokemon_notifier.dart';
import 'package:demo_app/views/bottom_sheet/viewmode_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/list_components/poke_list_item.dart';
import 'package:provider/provider.dart';
import 'package:demo_app/objects/favorite_model.dart';

class PokeList extends StatefulWidget {
  const PokeList({Key? key}) : super(key: key);
    @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  static const int pageSize = 30;
  bool isFavoriteMode = false;
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
    if (ret > count && isFavoriteMode) {
      ret = count;
    }
    if (ret > pokeMaxId) {
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

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteNotifier>(
      builder: (context, favs, child) => Column(
      children: [
        Container(
          height: 24,
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
                  return ViewModeBottomSheet(favMode: isFavoriteMode);
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
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  itemCount: itemCount(favs.favs.length, _currentPage) + 1,
                  itemBuilder: (context, index) {
                    if (index == itemCount(favs.favs.length, _currentPage)) {
                      return OutlinedButton(
                        child: const Text('more'),
                        onPressed: isLastPage(favs.favs.length, _currentPage)
                          ? null
                          : () => {
                          setState(() => _currentPage += 1),
                        },
                      );
                    } else {
                      return PokeListItem(
                        poke: pokes.byId(itemId(favs.favs, index)),
                      );
                    }
                  },
                );
              }
            }
          ),
        ),
      ]),
    );
  }
}