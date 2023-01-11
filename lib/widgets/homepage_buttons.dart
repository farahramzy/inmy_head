import 'package:flutter/material.dart';
import 'package:inmy_head/screens/gratitude.dart';
import '../constants/color_constants.dart';
import 'package:inmy_head/constants/font_constants.dart';

class HomePageButtons extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  const HomePageButtons(this.text, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<HomePageButtons> createState() => _HomePageButtonsState();
}

class _HomePageButtonsState extends State<HomePageButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: ColorManager.secondryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: widget.onPressed,
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: ColorManager.primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
