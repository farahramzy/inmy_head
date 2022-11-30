import 'package:flutter/material.dart';
import 'package:inmy_head/constants/constants.dart';

class WelcomeButton extends StatelessWidget {
  final String text;
  final double top;
  final double left;
  final Color colorText;
  final Color colorButton;
  final VoidCallback? welcomeButton2;

  const WelcomeButton(
      {Key? key,
      required this.text,
      required this.top,
      required this.left,
      required this.colorText,
      required this.colorButton,
      required this.welcomeButton2})
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
            side: BorderSide(
                width: 3, color: colorButton), 
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10) 
            ),
        onPressed: welcomeButton2,
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
