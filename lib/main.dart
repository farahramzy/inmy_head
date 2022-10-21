import 'package:flutter/material.dart';
import 'package:inmy_head/homepage_screens/homepage.dart';
import 'package:inmy_head/login/login_.dart';
// import 'homepage_screens/homepage.dart';

import 'package:inmy_head/signup/signup_.dart';
import 'package:inmy_head/welcome.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import '../constants.dart';
import 'signup/signup_tf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'welcome',
        routes: {
          'welcome': (context) => const Welcome(),
          'login': (context) => const LoginC(),
          'signup': (context) => const SignUpC(),
          'homePage': (context) => const HomePage(),
        });
  }
}
