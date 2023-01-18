// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:inmy_head/constants/font_constants.dart';

class Gratitudebutton extends StatelessWidget {
  final String text;
  final double top;
  final double left;
  final Color colorText;
  final Color colorButton;
  final VoidCallback? gratitudeButton2;

  const Gratitudebutton(
      {Key? key,
      required this.text,
      required this.top,
      required this.left,
      required this.colorText,
      required this.colorButton,
      required this.gratitudeButton2,
      required Null Function() GratitudeButton2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      height: 50,
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            side: BorderSide(width: 3, color: colorButton),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10)),
        onPressed: gratitudeButton2,
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(
              color: colorText,
              fontWeight: FontWeightManager.bold,
              fontSize: FontSize.s15),
        ),
      ),
    );
  }
}
