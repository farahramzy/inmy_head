import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import 'package:inmy_head/constants/font_constants.dart';

class AdminBox extends StatelessWidget {
  final String text;
  final Function()? button;
  const AdminBox({
    Key? key,
    required this.text,
    this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40, //height of button
        width: 220, //width of button
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: ColorManager.primaryColor,
                side: BorderSide(
                    width: 7,
                    color: ColorManager.primaryColor), //border width and color
                // elevation: 3, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.all(10) //content padding inside button
                ),
            onPressed: button,
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  fontWeight: FontWeightManager.bold, fontSize: FontSize.s15),
            )));
  }
}
