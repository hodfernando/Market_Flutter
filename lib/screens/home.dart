import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:market/consts/colors.dart';

class Home extends StatefulWidget {
  static const routeName = '/Home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _carouselImages = [
    'assets/images/carousel1.png',
    'assets/images/carousel2.jpeg',
    'assets/images/carousel3.jpg',
    'assets/images/carousel4.png',
  ];

  List _brandImages = [
    'assets/images/addidas.jpg',
    'assets/images/apple.jpg',
    'assets/images/dell.jpg',
    'assets/images/h&m.jpg',
    'assets/images/nike.jpg',
    'assets/images/samsung.jpg',
    'assets/images/huawei.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropScaffold(
        frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
        headerHeight: MediaQuery.of(context).size.height * 0.25,
        appBar: BackdropAppBar(
          title: Text("Home"),
          leading: BackdropToggleButton(icon: AnimatedIcons.home_menu),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              ColorsConsts.starterColor,
              ColorsConsts.endColor
            ])),
          ),
          actions: <Widget>[
            IconButton(
              iconSize: 15,
              padding: const EdgeInsets.all(10),
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 13,
                  backgroundImage: NetworkImage(
                      'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg'),
                ),
              ),
              onPressed: () {},
            )
          ],
        ),
        backLayer: Center(
          child: Text("Back Layer"),
        ),
        frontLayer: Column(
          children: [
            Container(
              height: 190.0,
              width: double.infinity,
              child: Carousel(
                boxFit: BoxFit.fill,
                autoplay: true,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 5.0,
                dotIncreasedColor: Colors.purple,
                dotBgColor: Colors.black.withOpacity(0.2),
                dotPosition: DotPosition.bottomCenter,
                showIndicator: true,
                indicatorBgPadding: 5.0,
                images: [
                  ExactAssetImage(_carouselImages[0]),
                  ExactAssetImage(_carouselImages[1]),
                  ExactAssetImage(_carouselImages[2]),
                  ExactAssetImage(_carouselImages[3]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Popular Brands',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'View all...',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.95,
              child: Swiper(
                itemCount: _brandImages.length,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                onTap: (index) {},
                itemBuilder: (BuildContext ctx, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blueGrey,
                      child: Image.asset(
                        _brandImages[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
