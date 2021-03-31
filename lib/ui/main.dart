import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:reviewbahi/core/MyColor.dart';


import 'home/home.dart';
import 'login/loginScreen.dart';
import 'login_pin/InputPinScreen.dart';

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
        theme: ThemeData(primaryColor: CustomColors.primaryColor, accentColor: Colors.yellow,fontFamily: 'Constantia'),
        initialRoute: SplashScreenView.routeName,
        routes: {
          SplashScreenView.routeName: (context) => SplashScreenView(),
          LoginPage.routeName: (context) => LoginPage(),
          HomeScreen.routeName: (context) => HomeScreen(),
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
