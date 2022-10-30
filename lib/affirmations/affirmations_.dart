import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/affirmations_box.dart';


class Affirmations extends StatelessWidget {
  const Affirmations({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/orangeBackground.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Color.fromARGB(196, 187, 160, 222),
          // backgroundColor: ColorManager.beige,
          body: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 120, // <-- SEE HERE
                ),
                Text(
                  'POSITIVE AFFIRMATIONS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeightManager.w800,
                      fontSize: FontSize.s40),
                ),
                SizedBox(
                  height: 60, // <-- SEE HERE
                ),
                AffirmationBox(text: "affirmation1"),
                SizedBox(
                  height: 20, // <-- SEE HERE
                ),
                AffirmationBox(text: "affirmation2"),
                SizedBox(
                  height: 20, // <-- SEE HERE
                ),
                AffirmationBox(text: "affirmation3"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
