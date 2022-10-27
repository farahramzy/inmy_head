import 'package:flutter/material.dart';
import '../constants.dart';

class AffirmationBox extends StatelessWidget {
  final String text;
  const AffirmationBox({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
    decoration: BoxDecoration(
    border: Border.all(color: ColorManager.black, width: 3),
    borderRadius: BorderRadius.circular(20),
    ),
    child: Text(text, style: const TextStyle(fontSize:(FontSize.s25)),),
);
  }
}