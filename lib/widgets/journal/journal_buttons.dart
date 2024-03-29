import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class JournalButton extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  const JournalButton(this.text, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  State<JournalButton> createState() => _JournalButtonState();
}

class _JournalButtonState extends State<JournalButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
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
            ),
          ),
        ],
      ),
    );
  }
}
