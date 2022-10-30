import 'package:flutter/material.dart';
import 'package:inmy_head/screens/login_.dart';
import 'package:inmy_head/screens/forget_.dart';
import '../constants/constants.dart';
import '../widgets/signup_tf.dart';
import 'affirmations_.dart';
// void main() => runApp(const SignUpC());

// class SignUpC extends StatelessWidget {
//   const SignUpC({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // const appTitle = 'Form Styling Demo';
//     return const MaterialApp(
//       // title: appTitle,
//       home: Scaffold(
//         // appBar: AppBar(
//         //   // title: const Text(appTitle),
//         //   backgroundColor: Colors.purple,
//         // ),
//         body: SignUp(),
//       ),
//     );
//   }
// }

// class SignUp extends StatelessWidget {
//   const SignUp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           const SizedBox(
//             height: 30, // <-- SEE HERE
//           ),
//           const Text(
//             'Create New Account',
//             textAlign: TextAlign.right,
//             style: TextStyle(
//                 fontWeight: FontWeightManager.w800, fontSize: FontSize.s40),
//           ),
//           const SizedBox(
//             height: 5, // <-- SEE HERE
//           ),
//           RichText(
//             text: TextSpan(
//               text: 'Already have one? ',
//               style: TextStyle(
//                   color: ColorManager.black,
//                   fontSize: FontSize.s20,
//                   fontWeight: FontWeightManager.bold),
//             ),
//           ),
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const LoginC()),
//               );
//             },
//             child: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Log in here',
//                     style: TextStyle(
//                         color: ColorManager.lightblue, fontSize: FontSize.s15),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15, // <-- SEE HERE
//           ),
//           const Align(
//             alignment: FractionalOffset(0.15, 0.9),
//             child: Text(
//               'Name',
//               textAlign: TextAlign.right,
//               // alignment: Alignment.topRight,
//               style: TextStyle(
//                   fontWeight: FontWeightManager.w800, fontSize: FontSize.s18),
//             ),
//           ),
//           TextFieldX(
//             button: () {},
//           ),
//           const SizedBox(
//             height: 10, // <-- SEE HERE
//           ),
//           const Align(
//             alignment: FractionalOffset(0.15, 0.9),
//             child: Text(
//               'Email',
//               textAlign: TextAlign.right,
//               // alignment: Alignment.topRight,
//               style: TextStyle(
//                   fontWeight: FontWeightManager.w800, fontSize: FontSize.s18),
//             ),
//           ),
//           TextFieldX(
//             button: () {},
//           ),
//           const SizedBox(
//             height: 10, // <-- SEE HERE
//           ),
//           const Align(
//             alignment: FractionalOffset(0.17, 0.9),
//             child: Text(
//               'PASSWORD',
//               textAlign: TextAlign.right,
//               style: TextStyle(
//                   fontWeight: FontWeightManager.w800, fontSize: FontSize.s18),
//             ),
//           ),
//           TextFieldX(
//             button: () {},
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//               height: 40, //height of button
//               width: 220, //width of button
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       primary: ColorManager.purple2,
//                       //background color of button
//                       side: BorderSide(
//                           width: 3,
//                           color: ColorManager.purple2), //border width and color
//                       // elevation: 3, //elevation of button
//                       shape: RoundedRectangleBorder(
//                           //to set border radius to button
//                           borderRadius: BorderRadius.circular(20)),
//                       padding: const EdgeInsets.all(
//                           10) //content padding inside button
//                       ),
//                   onPressed: () {
//                     //code to execute when this button is pressed.
//                   },
//                   child: const Text(
//                     'Signup',
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                         fontWeight: FontWeightManager.bold,
//                         fontSize: FontSize.s15),
//                   ))),
//           Container(
//             height: 185.42,
//             width: 290.0,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage('images/signup.png'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SignUpC extends StatefulWidget {
  const SignUpC({super.key, this.restorationId});
  final String? restorationId;
  @override
  State<SignUpC> createState() => _SignUpCState();
}

class _SignUpCState extends State<SignUpC> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          color: ColorManager.lightblue,
                          fontSize: FontSize.s15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15, // <-- SEE HERE
            ),
            const Align(
              alignment: FractionalOffset(0.10, 0.9),
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
              alignment: FractionalOffset(0.10, 0.9),
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
              alignment: FractionalOffset(0.10, 0.9),
              child: Text(
                'Password',
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
            OutlinedButton(
              //BIRTHDATE
              onPressed: () {
                _restorableDatePickerRouteFuture.present();
              },
              child: const Text('Pick Your Birthdate'),
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
                            color:
                                ColorManager.purple2), //border width and color
                        // elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(
                            10) //content padding inside button
                        ),
                    onPressed: () {
                      //code to execute when this button is pressed.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Affirmations()),
                      );
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
      ),
    );
  }
}
