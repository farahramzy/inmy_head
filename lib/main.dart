import 'package:flutter/material.dart';
import 'package:inmy_head/screens/admin_edit.dart';
import 'package:inmy_head/screens/homepage.dart';
import 'package:inmy_head/screens/login_.dart';
import 'package:inmy_head/screens/reflections.dart';
import 'package:inmy_head/screens/forget_.dart';
import 'package:inmy_head/screens/signup_.dart';
import 'package:inmy_head/screens/welcome.dart';
import 'package:inmy_head/screens/worry.dart';
import 'screens/affirmations_.dart';
import 'screens/edit_profile.dart';
import 'screens/gratitude.dart';
import 'screens/mood_tracker_screen.dart';
import 'screens/user_profile.dart';

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
          'adminedtit': (context) => AdminEdit(),
        });
  }
}
