import 'package:flutter/material.dart';

class TextFieldX extends StatelessWidget {
  // final Function() button;
  final VoidCallback? button;
  const TextFieldX({
    required this.button,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextField(
        onTap: button,
        decoration: const InputDecoration(
          // labelText: 'Email',
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 10, color: Color.fromARGB(255, 12, 12, 12)),
            // borderRadius: BorderRadius.circular(20),
          ),
          // labelText: 'Email',
        ),
      ),
    );
  }
}
