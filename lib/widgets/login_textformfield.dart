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
      width: 350,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        controller: controller,
        obscureText: obscureText,
        // validator: (emailController) {
        //   if (emailController != null &&
        //       emailController.isNotEmpty &&
        //       emailController == loginModel.username) {
        //     Navigator.pushNamed(context, 'journal');
        //     return null;
        //   } else {
        //     return 'Please enter Email';
        //   }
        // },
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
