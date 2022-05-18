import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:q10/screens/HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen.withScreenFunction(
        backgroundColor: Colors.amberAccent,
          splashTransition: SplashTransition.rotationTransition,
          duration: 10000,
          splash: Image.asset('assets/images/star.png'), screenFunction: ()async{
        await Future.delayed(Duration(seconds: 3));
        return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }), (route) => false);
        }));
  }
}







