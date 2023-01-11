// ignore_for_file: avoid_print
import 'package:inmy_head/constants/font_constants.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:inmy_head/data/user_data.dart';
import 'package:inmy_head/screens/admin.dart';
import '../constants/color_constants.dart';
import '../widgets/signup_tf.dart';
import 'package:image_picker/image_picker.dart';

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

  File? _image;
  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
  String downloadURL = '';
  Future getImage() async {
    XFile? selectedImage;
    selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    //Get a refrence to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('images');

    //Create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImage.child(uniqueFileName);

    try {
      //Store the file in the storage
      await referenceImageToUpload.putFile(File(selectedImage!.path));
      //Success: get the download URL for the image
      downloadURL = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print(e);
    }

    setState(() {
      _image = File(selectedImage!.path);
    });
  }

  final userData = UserData();
  @override
  Widget build(BuildContext context) {
    String? name;
    String? email;
    String? password;
    String? phoneNumber;

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
                    color: ColorManager.secondryColor,
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
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Log in here',
                      style: TextStyle(
                          color: Color.fromRGBO(33, 150, 243, 1),
                          fontSize: FontSize.s15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: CircleAvatar(
                radius: 40,
                backgroundImage: _image == null
                    ? const AssetImage('images/300.png')
                    : FileImage(_image!) as ImageProvider,
              ),
            ),
            const SizedBox(height: 10),
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
                phoneNumber = val;
              },
              labelText: 'Phone Number',
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
              height: 40,
              width: 220,
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
                  try {
                    await userData.createUserWithEmailAndPassword(
                        email!, password!);

                    userData.addUserDetails(userId, name!, email!, password!,
                        phoneNumber!, downloadURL, 'user');
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, 'journal');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:
                              const Text('The password provided is too weak.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                              'The account already exists for that email.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
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
          ],
        ),
      ),
    );
  }
}
