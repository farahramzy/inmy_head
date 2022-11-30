import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.pushNamed(context, 'worry');
      break;
    case 1:
      Navigator.pushNamed(context, 'gratitude');
      break;
    case 2:
      Navigator.pushNamed(context, 'reflections');
      break;
    case 3:
      Navigator.pushNamed(context, 'moodTracker');
      break;
    case 8:
      Navigator.pushNamed(context, 'homePage');
      break;
    case 9:
      Navigator.pushNamed(context, 'affirmations');
      break;

    case 10:
      Navigator.pushNamed(context, 'day');
      break;
    case 11:
      Navigator.pushNamed(context, 'welcome');
      break;
    case 12:
      Navigator.pushNamed(context, 'journal');
      break;
    case 13:
      FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, 'welcome');
      break;
  }
}
