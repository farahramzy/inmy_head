import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import 'package:inmy_head/constants/font_constants.dart';

class ScreenText extends StatelessWidget {
  const ScreenText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: FontSize.s20,
        fontWeight: FontWeightManager.bold,
      ),
    );
  }
}
