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
      height: 50, //height of button
      width: 250, //width of button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            //background color of button
            side: BorderSide(
                width: 3, color: colorButton), //border width and color
            // elevation: 3, //elevation of button
            shape: RoundedRectangleBorder(
                //to set border radius to button
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10) //content padding inside button
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
