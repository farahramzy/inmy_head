import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class LetsReflect extends StatelessWidget {
  const LetsReflect({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.screenPath,
  }) : super(key: key);

  // final JournalData journalData;
  final String text;
  final String imagePath;
  final String screenPath;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, screenPath);
        },
        child: Ink.image(
          image: AssetImage(imagePath),
          width: 100,
          height: 45,
          padding: const EdgeInsets.only(top: 77, left: 20),
          child: Text(
            text,
            style: TextStyle(
              color: ColorManager.secondryColor,
            ),
          ),
        ),
      ),
    );
  }
}
