import 'package:flutter/material.dart';

class TextFieldX extends StatefulWidget {
  final Function(String)? onChanged;
  final String labelText;
  final bool obscureText;

  const TextFieldX({
    Key? key,
    required this.onChanged,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);

  @override
  State<TextFieldX> createState() => _TextFieldXState();
}

class _TextFieldXState extends State<TextFieldX> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              width: 350,
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                obscureText: widget.obscureText,
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 10,
                      color: Color.fromARGB(255, 12, 12, 12),
                    ),
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
