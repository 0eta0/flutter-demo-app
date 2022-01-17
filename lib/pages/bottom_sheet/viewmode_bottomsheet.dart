import 'package:demo_app/pages/pokemon/list/pokemon_list_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewModeBottomSheet extends HookConsumerWidget {
  const ViewModeBottomSheet({
    Key? key,
    // required this.favMode,
    required this.gridMode,
  }) : super(key: key);

  // final bool favMode;
  final bool gridMode;

  String mainText(bool fav) {
    if (fav) {
      return 'お気に入りのポケモンが表示されています';
    } else {
      return 'すべてのポケモンが表示されています';
    }
  }

  String menuTitle(bool fav) {
    if (fav) {
      return '「すべて」表示に切り替え';
    } else {
      return '「お気に入り」表示に切り替え';
    }
  }

  String menuSubtitle(bool fav) {
    if (fav) {
      return '全てのポケモンが表示されます';
    } else {
      return 'お気に入りに登録したポケモンのみが表示されます';
    }
  }

  String displayModeTitle(bool grid) {
    if (grid) {
      return 'リスト表示に切り替え';
    } else {
      return 'グリッド表示に切り替え';
    }
  }

  String displayModeSubtitle(bool grid) {
    if (grid) {
      return 'ポケモンをリスト表示します';
    } else {
      return 'ポケモンをグリッド表示します';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(displayModeStateControllerProvider.notifier);
    final mode = ref.watch(displayModeStateControllerProvider);

    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).backgroundColor,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            //   child: Text(
            //     mainText(favMode),
            //     style: const TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // ListTile(
            //   leading: const Icon(Icons.swap_horiz),
            //   title: Text(
            //     menuTitle(favMode),
            //   ),
            //   subtitle: Text(
            //     menuSubtitle(favMode),
            //   ),
            //   onTap: () {
            //     changeFabMode(favMode);
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: const Icon(Icons.swap_horiz),
              title: Text(
                displayModeTitle(gridMode),
              ),
              subtitle: Text(
                displayModeSubtitle(gridMode),
              ),
              onTap: () {
                controller.update(gridMode ? DisplayMode.list : DisplayMode.grid);
                Navigator.pop(context);
              },
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
              child: const Text('キャンセル'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        ),
      ),
    );
  }
}