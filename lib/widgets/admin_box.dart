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
      height: 40,
      width: 220,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorManager.primaryColor,
            side: BorderSide(width: 7, color: ColorManager.primaryColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10)),
        onPressed: button,
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: const TextStyle(
              fontWeight: FontWeightManager.bold, fontSize: FontSize.s15),
        ),
      ),
    );
  }
}
