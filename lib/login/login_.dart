import 'package:flutter/material.dart';
import 'package:inmy_head/signup/signup_.dart';
import '../constants.dart';
import '../homepage_screens/homepage.dart';
import 'login_tf.dart';

class LoginC extends StatefulWidget {
  const LoginC({super.key});

  @override
  State<LoginC> createState() => _LoginCState();
}

class _LoginCState extends State<LoginC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50, // <-- SEE HERE
            ),
            const Text(
              'Login',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeightManager.w800, fontSize: FontSize.s40),
            ),
            const SizedBox(
              height: 10, // <-- SEE HERE
            ),
            const Text(
              'Still new here?',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeightManager.w800, fontSize: FontSize.s20),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpC()),
                );
              },
              child: Text(
                'Create new account',
                // textAlign: TextAlign.right,
                style: TextStyle(
                    color: ColorManager.blue,
                    fontWeight: FontWeight.normal,
                    fontSize: FontSize.s15),
              ),
            ),
            const SizedBox(
              height: 30, // <-- SEE HERE
            ),
            const Align(
              alignment: FractionalOffset(0.15, 0.9),
              child: Text(
                'EMAIL',
                textAlign: TextAlign.right,
                // alignment: Alignment.topRight,
                style: TextStyle(
                    fontWeight: FontWeightManager.w800, fontSize: FontSize.s18),
              ),
            ),
            TextFieldX(
              button: () {},
            ),
            const SizedBox(
              height: 20, // <-- SEE HERE
            ),
            const Align(
              alignment: FractionalOffset(0.17, 0.9),
              child: Text(
                'PASSWORD',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeightManager.w800, fontSize: FontSize.s18),
              ),
            ),
            TextFieldX(
              button: () {},
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Align(
                alignment: const FractionalOffset(0.8, 0.9),
                child: Text(
                  'Forgot password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: ColorManager.black,
                      fontWeight: FontWeight.normal,
                      fontSize: FontSize.s15),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 40, //height of button
                width: 220, //width of button
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorManager.darkblue,
                        //background color of button
                        side: BorderSide(
                            width: 3,
                            color:
                                ColorManager.darkblue), //border width and color
                        // elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(
                            10) //content padding inside button
                        ),
                    onPressed: () {
                      //code to execute when this button is pressed.
                    },
                    child: const Text(
                      'Login',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s15),
                    ))),
            Container(
              height: 221.42,
              width: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/login.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
