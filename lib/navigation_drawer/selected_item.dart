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
  }
}
