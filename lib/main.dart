import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reviewbahi/core/MyColor.dart';
import 'package:reviewbahi/ui/ask_detail_screen/ask_detail_screen.dart';
import 'package:reviewbahi/ui/detail_info/detail_info_screen.dart';
import 'package:reviewbahi/ui/filter_screen/filter_screen.dart';
import 'package:reviewbahi/ui/food_item/food_item_screen.dart';
import 'package:reviewbahi/ui/profile_screen/profile_screen.dart';
import 'package:reviewbahi/ui/resturant_screen/restaurant_screen.dart';
import 'package:reviewbahi/ui/review_detail_screen/review_detail_screen.dart';
import 'package:reviewbahi/ui/write_que_screen/write_que_screen.dart';
import 'package:reviewbahi/ui/write_review_screen/write_review_screen.dart';


import 'ui/home/home.dart';
import 'ui/login/loginScreen.dart';
import 'ui/login_pin/InputPinScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    runApp(
      new MaterialApp(
        title: 'review-bhai',
        theme: ThemeData(primaryColor: CustomColors.primaryColor, accentColor: CustomColors.accentColor,fontFamily: 'Constantia'),
        initialRoute: SplashScreenView.routeName,
        routes: {
          SplashScreenView.routeName: (context) => SplashScreenView(),
          LoginPage.routeName: (context) => LoginPage(),
          ReviewDetailScreen.routeName: (context) => ReviewDetailScreen(),
          AskDetailScreen.routeName: (context) => AskDetailScreen(),
          FilterScreen.routeName: (context) => FilterScreen(),
          DetailInfoScreen.routeName: (context) => DetailInfoScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          FoodItemScreen.routeName: (context) => FoodItemScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen(),
          RestaurantScreen.routeName: (context) => RestaurantScreen(),
          WriteQueScreen.routeName: (context) => WriteQueScreen(),
          WriteReviewScreen.routeName: (context) => WriteReviewScreen(),
          PinPutView.routeName: (context) => PinPutView(verificationId: "",resendToken: 00,phoneNumber: "",),
          // HomePage.routeName: (context) => HomePage(),
          // ReviewDetails.routeName: (context) => ReviewDetails()
        },

        debugShowCheckedModeBanner: false,
        // home: SplashScreenView(),
      ),
    );
  }
}


class SplashScreenView extends StatefulWidget {
  static const routeName = '/splashScreen';

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenViewState();
  }
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 500),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text('R E V I E W - B H A I',style: TextStyle(fontSize: 25,color: Colors.black54),),
      ),
    );
  }

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

}
