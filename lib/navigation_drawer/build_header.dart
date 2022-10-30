import 'package:flutter/material.dart';
import '../constants.dart';

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
