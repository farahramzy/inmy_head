import 'package:flutter/material.dart';
import 'package:inmy_head/screens/login_.dart';
import '../constants/color_constants.dart';
import 'package:inmy_head/constants/font_constants.dart';

class Forgetpass extends StatefulWidget {
  const Forgetpass({super.key});

  @override
  State<Forgetpass> createState() => _ForgetpassState();
}

class _ForgetpassState extends State<Forgetpass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Forgot  \n Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeightManager.w800, fontSize: FontSize.s40),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                text: 'Create new password for your',
                style: TextStyle(
                    color: ColorManager.secondryColor,
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.bold),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'account here',
                style: TextStyle(
                    color: ColorManager.secondryColor,
                    fontSize: FontSize.s20,
                    fontWeight: FontWeightManager.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: FractionalOffset(0.15, 0.9),
              child: Text(
                'Password',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeightManager.w800, fontSize: FontSize.s18),
              ),
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      onSaved: (button) => button,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 10,
                              color: Color.fromARGB(255, 12, 12, 12)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 40,
              width: 220,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.purple2,
                    //background color of button
                    side: BorderSide(width: 3, color: ColorManager.purple2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginC()),
                  );
                },
                child: const Text(
                  'Login',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeightManager.bold,
                      fontSize: FontSize.s15),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              height: 290.42,
              width: 360.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/password.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
