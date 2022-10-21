import 'package:flutter/material.dart';
import 'package:inmy_head/login/login_.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import '../../constants.dart';
import '../signup/signup_tf.dart';

void main() => runApp(const SignUpC());

class SignUpC extends StatelessWidget {
  const SignUpC({super.key});

  @override
  Widget build(BuildContext context) {
    // const appTitle = 'Form Styling Demo';
    return const MaterialApp(
      // title: appTitle,
      home: Scaffold(
        // appBar: AppBar(
        //   // title: const Text(appTitle),
        //   backgroundColor: Colors.purple,
        // ),
        body: SignUp(),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30, // <-- SEE HERE
          ),
          const Text(
            'Create New Account',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeightManager.w800, fontSize: FontSize.s40),
          ),
          const SizedBox(
            height: 5, // <-- SEE HERE
          ),
          RichText(
            text: TextSpan(
              text: 'Already have one? ',
              style: TextStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginC()),
              );
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Log in here',
                    style: TextStyle(
                        color: ColorManager.lightblue, fontSize: FontSize.s15),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15, // <-- SEE HERE
          ),
          const Align(
            alignment: FractionalOffset(0.15, 0.9),
            child: Text(
              'Name',
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
            height: 10, // <-- SEE HERE
          ),
          const Align(
            alignment: FractionalOffset(0.15, 0.9),
            child: Text(
              'Email',
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
            height: 10, // <-- SEE HERE
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 40, //height of button
              width: 220, //width of button
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: ColorManager.purple2,
                      //background color of button
                      side: BorderSide(
                          width: 3,
                          color: ColorManager.purple2), //border width and color
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
                    'Signup',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeightManager.bold,
                        fontSize: FontSize.s15),
                  ))),
          Container(
            height: 185.42,
            width: 290.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('images/signup.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
