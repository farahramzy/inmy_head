import 'package:flutter/material.dart';
import 'package:inmy_head/constants.dart';

import 'buttons_welcome.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 230, 255),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              right: 60,
              bottom: 90,
              child: Container(
                height: 600.42,
                width: 300.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/13.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 900.42,
                width: 500.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/12.png'),
                  ),
                ),
              ),
            ),
            Welcomebutton(
              text: 'Login',
              top: 500,
              left: 80,
              colorButton: ColorManager.white,
              colorText: ColorManager.purple3,
              welcomeButton2: () {
                Navigator.pushNamed(context, 'login');
              },
            ),
            Welcomebutton(
              text: 'Sign Up',
              top: 570,
              left: 80,
              colorButton: ColorManager.purple4,
              colorText: ColorManager.white,
              welcomeButton2: () {
                Navigator.pushNamed(context, 'signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}
