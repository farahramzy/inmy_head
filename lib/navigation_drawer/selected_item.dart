import 'package:flutter/material.dart';
import '../homepage_screens/homepage.dart';

selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
      break;
  }
}
