import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../consts/colors.dart';
import '../services/global_method.dart';
import 'auth/login.dart';
import 'auth/sign_up.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  // late AnimationController _animationController;
  // late Animation<double> _animation;

  // List<String> images = [
  //   'https://media.istockphoto.com/photos/man-at-the-shopping-picture-id868718238?k=6&m=868718238&s=612x612&w=0&h=ZUPCx8Us3fGhnSOlecWIZ68y3H4rCiTnANtnjHk0bvo=',
  //   'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1138257321%2F0x0.jpg%3Ffit%3Dscale',
  //   'https://e-shopy.org/wp-content/uploads/2020/08/shop.jpeg',
  //   'https://e-shopy.org/wp-content/uploads/2020/08/shop.jpeg',
  // ];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // images.shuffle();
    // _animationController =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 20));
    // _animation =
    //     CurvedAnimation(parent: _animationController, curve: Curves.linear)
    //       ..addListener(() {
    //         setState(() {});
    //       })
    //       ..addStatusListener((animationStatus) {
    //         if (animationStatus == AnimationStatus.completed) {
    //           _animationController.reset();
    //           _animationController.forward();
    //         }
    //       });
    // _animationController.forward();
  }

  @override
  void dispose() {
    // _animationController.dispose();
    super.dispose();
  }

  // Future<void> _googleSignIn() async {
  //   final googleSignIn = GoogleSignIn();
  //   final googleAccount = await googleSignIn.signIn();
  //   if (googleAccount != null) {
  //     final googleAuth = await googleAccount.authentication;
  //     if (googleAuth.accessToken != null && googleAuth.idToken != null) {
  //       try {
  //         var date = DateTime.now().toString();
  //         var dateparse = DateTime.parse(date);
  //         var formattedDate =
  //             "${dateparse.day}-${dateparse.month}-${dateparse.year}";
  //         final authResult = await _auth.signInWithCredential(
  //             GoogleAuthProvider.credential(
  //                 idToken: googleAuth.idToken,
  //                 accessToken: googleAuth.accessToken));
  //         await FirebaseFirestore.instance
  //             .collection('users')
  //             .doc(authResult.user!.uid)
  //             .set({
  //           'id': authResult.user!.uid,
  //           'name': authResult.user!.displayName,
  //           'email': authResult.user!.email,
  //           'phoneNumber': authResult.user!.phoneNumber,
  //           'imageUrl': authResult.user!.photoURL,
  //           'joinedAt': formattedDate,
  //           'createdAt': Timestamp.now(),
  //         });
  //       } catch (error) {
  //         _globalMethods.authErrorHandle(error.toString(), context);
  //       }
  //     }
  //   }
  // }

  void _loginAnonymosly() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInAnonymously();
    } catch (error) {
      _globalMethods.authErrorHandle(error.toString(), context);
      print('error occured ${error.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // CachedNetworkImage(
          //   imageUrl: images[1],
          //   // placeholder: (context, url) => Image.network(
          //   //   'https://cdn-icons-png.flaticon.com/512/7066/7066506.png',
          //   //   fit: BoxFit.contain,
          //   // ),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          //   fit: BoxFit.cover,
          //   height: double.infinity,
          //   width: double.infinity,
          //   alignment: FractionalOffset(_animation.value, 0),
          // ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Bem Vindo',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Bem Vindo a Nossa Loja Online',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: ColorsConsts.backgroundColor),
                        ),
                      )),
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Feather.user,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink.shade400),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                  color: ColorsConsts.backgroundColor),
                            ),
                          )),
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Inscrever-se',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Feather.user_plus,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              // SizedBox(height: 30),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: Divider(
              //           color: Colors.white,
              //           thickness: 2,
              //         ),
              //       ),
              //     ),
              //     Text(
              //       'Ou continue com',
              //       style: TextStyle(color: Colors.black),
              //     ),
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 10),
              //         child: Divider(
              //           color: Colors.white,
              //           thickness: 2,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // OutlineButton(
                  //   onPressed: _googleSignIn,
                  //   shape: StadiumBorder(),
                  //   highlightedBorderColor: Colors.red.shade200,
                  //   borderSide: BorderSide(width: 2, color: Colors.red),
                  //   child: Text('Google +'),
                  // ),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : OutlineButton(
                          onPressed: () {
                            _loginAnonymosly();
                            // Navigator.pushNamed(context, BottomBarScreen.routeName);
                          },
                          shape: const StadiumBorder(),
                          highlightedBorderColor: Colors.deepPurple.shade200,
                          borderSide: const BorderSide(
                              width: 2, color: Colors.deepPurple),
                          child: const Text('Entrar como convidado'),
                        ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
