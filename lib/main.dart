import 'package:flutter/material.dart';
import 'package:inmy_head/homepage_screens/homepage.dart';
import 'package:inmy_head/login/login_.dart';
import 'package:inmy_head/reflections/reflections.dart';
import 'package:inmy_head/signup/forget_.dart';
import 'package:inmy_head/signup/signup_.dart';
import 'package:inmy_head/Welcome%20Screen/welcome.dart';
import 'package:inmy_head/worry/worry.dart';
import 'affirmations/affirmations_.dart';
import 'user profile/edit_profile.dart';
import 'gratitude/gratitude.dart';
import 'mood_tracker/mood_tracker_screen.dart';
import 'user profile/user_profile.dart';

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
          'gratitude': (context) => const Gratitude(),
          'worry': (context) => const Worry(),
          'moodTracker': (context) => const MoodTracker(),
          'reflections': (context) => const Reflections(),
          'forgetpass': (context) => const Forgetpass(),
          'affirmations': (context) => const Affirmations(),
          'userProfile': (context) => const UserProfile(),
          'editProfile': (context) => const EditProfile(),
        });
  }
}
