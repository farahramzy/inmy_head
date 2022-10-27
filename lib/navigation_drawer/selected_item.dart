import 'package:flutter/material.dart';
import '../homepage_screens/homepage.dart';
import '../mood_tracker_screen.dart';

selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const MoodTracker(),
      ));
      break;
  }
}
