import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import '../constants.dart';
import 'login_tf.dart';

void main() => runApp(const LoginC());

class LoginC extends StatelessWidget {
  const LoginC({super.key});

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
        body: Login(),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50, // <-- SEE HERE
          ),
          const Text(
            'Login',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeightManager.w800,
                fontSize: FontSizeManager.x40),
          ),
          const SizedBox(
            height: 10, // <-- SEE HERE
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Still new here? ',
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: FontSizeManager.x20,
                      fontWeight: FontWeightManager.bold),
                ),
                TextSpan(
                  text: 'Create new account',
                  style: TextStyle(
                      color: ColorManager.lightblue,
                      fontSize: FontSizeManager.x15),
                  // recognizer: TapGestureRecognizer()
                  // ..onTap = () async {
                  //   var url =
                  //       "https://stackoverflow.com/questions/48914775/gesture-detection-in-flutter-textspan";
                  //   if (await canLaunchUrl(Uri.parse(url))) {
                  //     await launchUrl(Uri.parse(url));
                  //   } else {
                  //     throw "sorry! cannot load";
                  //   }
                  // },
                  onEnter: (event) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginC()),
                    );
                  },
                ),
              ],
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
                  fontWeight: FontWeightManager.w800,
                  fontSize: FontSizeManager.x18),
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
                  fontWeight: FontWeightManager.w800,
                  fontSize: FontSizeManager.x18),
            ),
          ),
          TextFieldX(
            button: () {},
          ),
          Align(
            alignment: const FractionalOffset(0.8, 0.9),
            child: RichText(
              text: TextSpan(
                children: [
                  // new TextSpan(
                  //   text: 'Still new here? ',
                  //   style: new TextStyle(
                  //       color: Colors.black,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),

                  TextSpan(
                    text: 'Forgot password?',
                    style: TextStyle(
                        color: ColorManager.black,
                        fontSize: FontSizeManager.x15),
                    // recognizer: TapGestureRecognizer()
                    // ..onTap : () async {
                    //   var url =
                    //       "https://stackoverflow.com/questions/48914775/gesture-detection-in-flutter-textspan";
                    //   if (await canLaunchUrl(Uri.parse(url))) {
                    //     await launchUrl(Uri.parse(url));
                    //   } else {
                    //     throw "sorry! cannot load";
                    //   }
                    // },
                    onEnter: (event) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginC()),
                      );
                    },
                  ),
                ],
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
                        fontSize: FontSizeManager.x15),
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
    );
  }
}

// class TextFieldX extends StatelessWidget {
//   // final Function() button;
//   final VoidCallback? button;
//   const TextFieldX({
//     required this.button,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//       child: TextField(
//         onTap: button,
//         decoration: const InputDecoration(
//           // labelText: 'Email',
//           border: OutlineInputBorder(
//             borderSide:
//                 BorderSide(width: 10, color: Color.fromARGB(255, 192, 42, 164)),
//             // borderRadius: BorderRadius.circular(20),
//           ),
//           // labelText: 'Email',
//         ),
//       ),
//     );
//   }
// }
