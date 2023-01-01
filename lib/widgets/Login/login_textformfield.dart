import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginTextFormFiled extends StatelessWidget {
  // String? validateEmail(String? formEmail) {
  //   if (formEmail == null || formEmail.isEmpty) {
  //     return 'This field is required.';
  //   }

  //   return null;
  // }

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
      width: 350,
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
