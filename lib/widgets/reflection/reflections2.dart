import 'package:flutter/material.dart';
import 'package:inmy_head/constants/color_constants.dart';
import 'package:inmy_head/constants/font_constants.dart';
import '../../screens/homepage.dart';

class TextPage extends StatelessWidget {
  final String text;
  const TextPage({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const FractionalOffset(0.45, 0.30),
      child: Text(text,
          style: const TextStyle(
              fontWeight: FontWeightManager.w800, fontSize: FontSize.s18)),
    );
  }
}

class TextFieldX extends StatelessWidget {
  final VoidCallback? button;
  const TextFieldX({
    required this.button,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: TextFormField(
        onTap: button,
        decoration: const InputDecoration(
          labelText: 'answer',
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 10),
          ),
        ),
        maxLines: 5,
      ),
    );
  }
}

class Cont1 extends StatelessWidget {
  const Cont1({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const FractionalOffset(0.40, 0.45),
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
            color: ColorManager.purple2,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Column(children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            height: 80,
          ),
          TextFieldX(
            button: () {},
          ),
        ]),
      ),
    );
  }
}

class Cont2 extends StatelessWidget {
  const Cont2({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const FractionalOffset(0.40, 0.45),
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
            color: ColorManager.beigYellow,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
            )),
        child: Column(children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            height: 80,
          ),
          TextFieldX(
            button: () {},
          ),
        ]),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const FractionalOffset(0.45, 0.90),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.darkblue,
              side: BorderSide(width: 3, color: ColorManager.darkblue),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(10)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Text(
            'Submit',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeightManager.bold, fontSize: FontSize.s15),
          )),
    );
  }
}
