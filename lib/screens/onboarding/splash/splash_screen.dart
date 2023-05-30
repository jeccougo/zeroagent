import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zeroagent/screens/onboarding/splash/welcome.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   Future.delayed(Duration(seconds: 6), (){
     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> WelcomeScreen()));
   });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade400,
                Colors.blue.shade900,

              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/zeroagent.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // const Text('Welcome to Ime Afia!',
                // style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal,
                // color: Colors.white),),
                // CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


