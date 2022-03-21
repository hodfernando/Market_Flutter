import 'package:flutter/material.dart';
import 'package:market/provider/dark_theme_provider.dart';
import 'package:market/screens/bottom_bar.dart';
import 'package:market/screens/cart.dart';
import 'package:market/screens/feeds.dart';
import 'package:market/screens/home.dart';
import 'package:market/screens/wishlist.dart';
import 'package:provider/provider.dart';
import 'consts/theme_data.dart';
import 'inner_screens/brands_navigation_rail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Flutter Market',
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            //initialRoute: '/',
            routes: {
              //   '/': (ctx) => LandingPage(),
              Home.routeName: (ctx) => Home(),
              BrandNavigationRailScreen.routeName: (ctx) =>
                  BrandNavigationRailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              Feeds.routeName: (ctx) => Feeds(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
            },
          );
        }));
  }
}
