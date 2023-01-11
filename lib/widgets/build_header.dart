import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import 'package:inmy_head/constants/font_constants.dart';

buildHeader({
  required String title,
  required VoidCallback? onClicked,
}) {
  return InkWell(
    onTap: onClicked,
    child: Row(
      children: [
        Text(title,
            style: TextStyle(
                fontWeight: FontWeightManager.bold,
                color: ColorManager.beigYellow,
                fontSize: FontSize.s25)),
      ],
    ),
  );
}
