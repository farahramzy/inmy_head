import 'package:flutter/material.dart';

class EditFormField extends StatelessWidget {
  final String formFieldText;
  const EditFormField({
    Key? key,
    required this.formFieldText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(
        height: 80,
        width: 330,
        child: TextFormField(
          onTap: () {},
          decoration: InputDecoration(
            labelText: formFieldText,
            border: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 10, color: Color.fromARGB(255, 12, 12, 12)),
            ),
          ),
        ),
      ),
    );
  }
}
