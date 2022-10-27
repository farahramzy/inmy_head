import 'package:flutter/material.dart';
import 'package:inmy_head/constants.dart';

import '../homepage_screens/homepage.dart';

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
    return Align(
      alignment: const FractionalOffset(0.5, 0.5),
      child: TextField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'What are you grateful for?',
        ),
        maxLines: 4,
        onSubmitted: (String value) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
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
            color: ColorManager.purple4,
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
            color: ColorManager.beige,
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
      alignment: const FractionalOffset(0.5, 0.650),
      child: SizedBox(
        width: 200,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorManager.purple4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: Text(
            'Submit',
            style: TextStyle(
              color: ColorManager.black,
              fontSize: FontSize.s25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
//       child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//               primary: ColorManager.purple3,
//               side: BorderSide(width: 3, color: ColorManager.purple3),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20)),
//               padding: const EdgeInsets.all(10)),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HomePage()),
//             );
//           },
//           child: const Text(
//             'Submit',
//             textAlign: TextAlign.right,
//             style: TextStyle(
//                 fontWeight: FontWeightManager.bold, fontSize: FontSize.s15),
//           )),
//     );
//   }
// }


// It only shows Image from assets
// class ImagePage extends StatelessWidget {
//   final String image;
//   const ImagePage({required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(image);
//   }