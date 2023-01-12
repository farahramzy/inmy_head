import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/screens/admin.dart';
import 'package:inmy_head/screens/blog_page.dart';
import 'package:inmy_head/screens/edit_gratitude.dart';
import 'package:inmy_head/screens/edit_reflect.dart';
import 'package:inmy_head/screens/day.dart';
import 'package:inmy_head/screens/edit_worry.dart';
import 'package:inmy_head/screens/homepage.dart';
import 'package:inmy_head/screens/journal.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
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
        'journal': (context) => const Journal(),
        'login': (context) => const LoginC(),
        'signup': (context) => const SignUpC(),
        'day': (context) => const Day(),
        'homePage': (context) => const HomePage(),
        'gratitude': (context) => const Gratitude(),
        'worry': (context) => const Worry(),
        'moodTracker': (context) => const MoodTracker(),
        'reflections': (context) => const Reflections(),
        'forgetpass': (context) => const Forgetpass(),
        'affirmations': (context) => const Affirmations(),
        'userProfile': (context) => const UserProfile(),
        'editProfile': (context) => const EditProfile(),
        'admin': (context) => const Admin(),
        'editReflect': (context) => const EditReflection(),
        'editWorry': (context) => const EditWorry(),
        'editGratitude': (context) => const EditGratitude(),
        'blog': (context) => BlogPage(),
      },
    );
  }
}
