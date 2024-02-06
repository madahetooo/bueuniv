import 'dart:async';

import 'package:bue/authentication/login_screen.dart';
import 'package:bue/authentication/tabbar_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => TabbarScreen())));
  }

  @override
  Widget build(BuildContext context) {
    // WidgetsFlutterBinding.ensureInitialized();
    //  Firebase.initializeApp();
    return  Scaffold(
      backgroundColor: Colors.redAccent,
      body: SpinKitPianoWave(
        color: Colors.white,
      ),
      // body:  Center(
      //   child: Image.network(
      //       "https://www.bue.edu.eg/uploads/home-slides/2023-05-02%2016-00-33.193-home-slide-d-_1920x800.Jpeg"),
      // ),
    );
  }
}
