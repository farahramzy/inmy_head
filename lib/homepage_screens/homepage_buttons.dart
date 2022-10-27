import 'package:flutter/material.dart';
import 'package:inmy_head/gratitude/gratitude.dart';
import '../constants.dart';

class HomePageButtons extends StatefulWidget {
  final String text;
  const HomePageButtons(this.text, {Key? key}) : super(key: key);

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
                color: ColorManager.black,
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Gratitude()),
              );
            },
            child: Container(
              height: 60,
              width: 250,
              decoration: BoxDecoration(
                color: ColorManager.darkPurple,
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
