// ignore_for_file: avoid_print
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
  const SignUpC({super.key});
 // final String? restorationId;
  @override
  State<SignUpC> createState() => _SignUpCState();
}

class _SignUpCState extends State<SignUpC>  {
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
    DateTime? d;

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
                    ? const AssetImage('images/2.png')
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
                    onPressed: () {
                    DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    //minTime: DateTime(2000, 1, 1),
                    //maxTime: DateTime(2022, 12, 31),
                    onChanged: (date) {print('change $date'); d = date ;},
                    onConfirm: (date) {print('confirm $date');d = date ;},
                    currentTime: DateTime.now(), locale: LocaleType.en);},
                    child: const Text('Birthday Date')
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
                        phoneNumber!,d.toString(), downloadURL, 'user');
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
