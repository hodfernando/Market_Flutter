import 'package:flutter/material.dart';
import 'package:market/screens/upload_product_form.dart';
import 'bottom_bar.dart';

class MainScreens extends StatelessWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [BottomBarScreen(), UploadProductForm()],
    );
  }
}
