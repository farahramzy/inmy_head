// ignore_for_file: unnecessary_const

// import 'gratitude_button.dart';

import 'package:flutter/material.dart';

import 'gratitude2.dart';

class Gratitude extends StatefulWidget {
  const Gratitude({super.key});

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  get canvas => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/wallpapergratitude.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
            children: <Widget>[
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "Today I am grateful for..."),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "What was the best part of your day?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "What made you laugh or smile today?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "Write about a beautiful thing you saw..."),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "What is your favorite moment today?"),
                  Button(),
                ],
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}













//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorManager.beige,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               right: 60,
//               bottom: 290,
//               child: Container(
//                 height: 600.42,
//                 width: 300.0,
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: AssetImage('images/rectangle.png'),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 50,
//               left: 105,
//               child: Text(
//                 'Today I am grateful for...',
//                 style: TextStyle(
//                     fontWeight: FontWeightManager.w800,
//                     fontSize: FontSize.s18,
//                     color: ColorManager.purple3),
//               ),
//             ),
//             Positioned(
//                 height: 40, //height of button
//                 width: 100, //width of button
//                 top: 590,
//                 left: 270,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         primary: ColorManager.darkblue,
//                         //background color of button
//                         side: BorderSide(
//                             width: 3,
//                             color:
//                                 ColorManager.darkblue), //border width and color
//                         // elevation: 3, //elevation of button
//                         shape: RoundedRectangleBorder(
//                             //to set border radius to button
//                             borderRadius: BorderRadius.circular(20)),
//                         padding: const EdgeInsets.all(
//                             10) //content padding inside button
//                         ),
//                     onPressed: () {
//                       //code to execute when this button is pressed.
//                     },
//                     child: const Text(
//                       'next',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(
//                           fontWeight: FontWeightManager.bold,
//                           fontSize: FontSize.s15),
//                     ))),
//             Positioned(
//               height: 1000, //height of button
//               width: 300, //width of button
//               top: 150,
//               left: 50,
//               child: TextField(
//                 decoration: InputDecoration(
//                   focusColor: ColorManager.black,
//                   border: const OutlineInputBorder(),
//                   hintText: 'I am grateful for',
//                 ),
//                 maxLines: 20,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';