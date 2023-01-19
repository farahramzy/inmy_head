import 'package:flutter/material.dart';

class LoginTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  const LoginTextFormFiled({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obscureText,
        // validator: validateEmail,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 10,
              color: Color.fromARGB(255, 12, 12, 12),
            ),
          ),
        ),
      ),
    );
  }
}
