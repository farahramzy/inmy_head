import 'package:flutter/material.dart';
import 'package:inmy_head/constants/constants.dart';

import '../widgets/buttons_welcome.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 230, 255),
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
            WelcomeButton(
              text: 'Login',
              top: 520,
              left: 80,
              colorButton: ColorManager.beige,
              colorText: ColorManager.purple3,
              welcomeButton2: () {
                Navigator.pushNamed(context, 'login');
              },
            ),
            WelcomeButton(
              text: 'Sign Up',
              top: 582,
              left: 80,
              colorButton: ColorManager.purple4,
              colorText: ColorManager.white,
              welcomeButton2: () {
                Navigator.pushNamed(context, 'signup');
              },
            ),
            Positioned(
              top: 460,
              left: 155,
              child: Text(
                'In My Head',
                style: TextStyle(
                    fontWeight: FontWeightManager.w800,
                    fontSize: FontSize.s18,
                    color: ColorManager.beige),
              ),
            ),
            Positioned(
              top: 480,
              left: 85,
              child: Text(
                ' Your Digital Anxiety Journal',
                style: TextStyle(
                    fontWeight: FontWeightManager.w800,
                    fontSize: FontSize.s18,
                    color: ColorManager.beige),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
