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
        Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 15.0, bottom: 10.0),
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeightManager.bold,
                  color: ColorManager.beigYellow,
                  fontSize: FontSize.s25)),
        ),
      ],
    ),
  );
}
