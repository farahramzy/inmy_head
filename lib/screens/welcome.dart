import 'package:flutter/material.dart';
import 'package:inmy_head/constants/constants.dart';
import '../widgets/buttons_welcome.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}
const double width = 90;
const double height = 60;

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/welcome.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                  height: MediaQuery.of(context).size.height / 0.5,
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
              top: MediaQuery.of(context).size.height / 1.33,
              left: MediaQuery.of(context).size.width / 5,
              colorButton: ColorManager.beige,
              colorText: ColorManager.purple3,
              welcomeButton2: () {
                Navigator.pushNamed(context, 'login');
              },
            ),
            WelcomeButton(
              text: 'Sign Up',
              top: MediaQuery.of(context).size.height / 1.2,
              left: MediaQuery.of(context).size.width / 5,
              colorButton: ColorManager.purple4,
              colorText: ColorManager.white,
              welcomeButton2: () {
                Navigator.pushNamed(context, 'signup');
              },
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 1.47,
              left: MediaQuery.of(context).size.width / 10.6,
              child: Text(
                ' Your Digital Anxiety Journal',
                style: TextStyle(
                    fontWeight: FontWeightManager.w800,
                    fontSize: FontSize.s25,
                    color: ColorManager.beige),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
