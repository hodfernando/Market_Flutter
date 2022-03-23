import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:market/consts/my_icons.dart';
import 'package:market/screens/feeds.dart';
import 'package:market/screens/wishlist/wishlist.dart';
import '../screens/cart/cart.dart';
import '../screens/upload_product_form.dart';

class BackLayerMenu extends StatelessWidget {
  BackLayerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropNavigationBackLayer(
      itemPadding: const EdgeInsets.symmetric(horizontal: 20),
      items: [
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            content(context, () {
              navigateTo(context, Feeds.routeName);
            }, 'Feeds', 0);
          },
          child: const Text("Feeds"),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            content(context, () {
              navigateTo(context, CartScreen.routeName);
            }, 'Cart', 1);
          },
          child: const Text("Carrinho"),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            content(context, () {
              navigateTo(context, WishlistScreen.routeName);
            }, 'Lista de Desejos', 2);
          },
          child: const Text("Lista de Desejos"),
        ),
        const SizedBox(height: 10.0),
        ElevatedButton(
          onPressed: () {
            content(context, () {
              navigateTo(context, UploadProductForm.routeName);
            }, 'Adicionar novo produto', 3);
          },
          child: const Text("Adicionar novo produto"),
        ),
      ],
      onTap: (int position) => {print(position)},
    );
  }

  final List _contentIcons = [
    MyAppIcons.rss,
    MyAppIcons.bag,
    MyAppIcons.wishlist,
    MyAppIcons.upload
  ];

  void navigateTo(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(
      routeName,
    );
  }

  Widget content(BuildContext ctx, Function fct, String text, int index) {
    return InkWell(
      onTap: fct(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          Icon(_contentIcons[index])
        ],
      ),
    );
  }
}
