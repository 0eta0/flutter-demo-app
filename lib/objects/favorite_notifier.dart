import 'package:flutter/material.dart';
import 'package:demo_app/objects/favorite_model.dart';
import 'package:demo_app/utils/favorite_db.dart';

class FavoriteNotifier extends ChangeNotifier {
  final List<Favorite> _favs = [];

  FavoriteNotifier() {
    syncDb();
  }

  void syncDb() async {
    FavoritesDb.read().then((val) {
      val.sort((a, b) => a.pokeId.compareTo(b.pokeId));
      _favs
        ..clear()
        ..addAll(val);
    });
    notifyListeners();
  }

  List<Favorite> get favs => _favs;

  void toggle(Favorite fav) {
    if (isExist(fav.pokeId)) {
      delete(fav.pokeId);
    } else {
      add(fav);
    }
  }

  bool isExist(int id) {
    if (_favs.indexWhere((fav) => fav.pokeId == id) < 0) {
      return false;
    }
    return true;
  }

  void add(Favorite fav) async {
      favs.add(fav);
      await FavoritesDb.create(fav);
      notifyListeners();
  }

  void delete(int id) async {
    favs.removeWhere((fav) => fav.pokeId == id);
    await FavoritesDb.delete(id);
    notifyListeners();
    // エラー処理あった方が良い
  }
}