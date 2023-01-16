import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      Navigator.pushNamed(context, 'editWorry');
      break;
    case 1:
      Navigator.pushNamed(context, 'editGratitude');
      break;
    case 2:
      Navigator.pushNamed(context, 'editReflect');
      break;

    case 3:
      FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, 'welcome');
      break;
  }
}
