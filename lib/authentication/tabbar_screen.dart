import 'package:bue/authentication/login_screen.dart';
import 'package:bue/authentication/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  @override
  Widget build(BuildContext context) {
    //  Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BUE APP'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Login",
                  icon: Icon(Icons.login),
                ),
                Tab(
                  text: "Register",
                  icon: Icon(Icons.login),
                ),
              ],
            ),
          ),
          body: TabBarView(

            children: [
              LoginScreen(title: "BUE"),
              RegistrationScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
