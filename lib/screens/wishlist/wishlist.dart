import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../consts/my_icons.dart';
import '../../provider/favs_provider.dart';
import '../../services/global_method.dart';
import 'wishlist_empty.dart';
import 'wishlist_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';

  WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final favsProvider = Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text(
                  'Lista de Desejos (${favsProvider.getFavsItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Limpar a lista de desejos!',
                        'Sua lista de desejos será limpa!',
                        () => favsProvider.clearFavs(),
                        context);
                    // cartProvider.clearCart();
                  },
                  icon: Icon(MyAppIcons.trash),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: favsProvider.getFavsItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ChangeNotifierProvider.value(
                  value: favsProvider.getFavsItems.values.toList()[index],
                  child: WishlistFull(
                    productId: favsProvider.getFavsItems.keys.toList()[index],
                  ),
                );
              },
            ),
          );
  }
}
