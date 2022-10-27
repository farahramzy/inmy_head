import 'package:flutter/material.dart';

// import '../SignupData.dart';

class TextFieldX extends StatefulWidget {
  // final Function() button;
  final VoidCallback? button;
  // final String button;
  const TextFieldX({
    required this.button,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFieldX> createState() => _TextFieldXState();
}

class _TextFieldXState extends State<TextFieldX> {
  final _formKey = GlobalKey<FormState>();

  // final loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // <-- SEE HERE
            width: 350,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              // onSaved: (val) => setState(() => loginData.username = val!),
              onSaved: (button) => button,
              decoration: const InputDecoration(
                // labelText: 'Email',
                border: OutlineInputBorder(
                borderSide: BorderSide(
                width: 10, color: Color.fromARGB(255, 12, 12, 12)),
                  // borderRadius: BorderRadius.circular(20),
                ),
                // labelText: 'Email',
              ),
            ),
          ),
        ],
      ),
    );
  }
}