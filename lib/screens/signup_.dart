import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inmy_head/screens/admin.dart';
import '../constants/constants.dart';
import '../widgets/signup_tf.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      setState(
        () {
          _selectedDate.value = newSelectedDate;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;
    String? password;

    //////////FIREBASE//////////
    //User Details
    Future addUserDetails(
        String userName, String userEmail, String userPassword) async {
      await FirebaseFirestore.instance.collection('users').add({
        'Name': userName,
        'Email': userEmail,
        'Password': userPassword,
      });
    }

    Future signUp() async {
      //Create User with email and Password
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);

      //Add User Details
      addUserDetails(
        name!,
        email!,
        password!,
      );
    }
    //////////FIREBASE//////////

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'Create New Account',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeightManager.w800, fontSize: FontSize.s35),
              ),
            ),
            const SizedBox(height: 20),
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
                  MaterialPageRoute(builder: (context) => const Admin()),
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
            const SizedBox(height: 15),
            TextFieldX(
              onChanged: (val) {
                name = val;
              },
              labelText: 'Name',
              obscureText: false,
            ),
            const SizedBox(height: 15),
            TextFieldX(
              onChanged: (val) {
                email = val;
              },
              labelText: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 15),
            TextFieldX(
              onChanged: (val) {
                password = val;
              },
              labelText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              //BIRTHDATE
              onPressed: () {
                _restorableDatePickerRouteFuture.present();
              },
              child: const Text('Pick Your Birthdate'),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 40, //height of button
              width: 220, //width of button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.purple2,
                  side: BorderSide(width: 3, color: ColorManager.purple2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () async {
                  await signUp();
                  // ignore: use_build_context_synchronously
                  Navigator.pushNamed(context, 'journal');
                },
                child: const Text(
                  'Signup',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeightManager.bold,
                      fontSize: FontSize.s15),
                ),
              ),
            ),
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
