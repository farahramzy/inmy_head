// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/screens/signup_.dart';
import '../constants/constants.dart';
import '../data/repositories/user_provider.dart';
import '../model/user_model.dart';
import '../widgets/login_textformfield.dart';
import 'forget_.dart';
import '../model/login_model.dart';

class LoginC extends ConsumerStatefulWidget {
  const LoginC({super.key});

  @override
  ConsumerState<LoginC> createState() => _LoginCState();
}

class _LoginCState extends ConsumerState<LoginC> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userData = UserData();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final loginModel = LoginModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Login',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeightManager.w800, fontSize: FontSize.s40),
            ),
            const SizedBox(
              height: 10,
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
                style: TextStyle(
                    color: ColorManager.blue,
                    fontWeight: FontWeight.normal,
                    fontSize: FontSize.s15),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginTextFormFiled(
                      controller: emailController,
                      labelText: 'Email',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginTextFormFiled(
                      controller: passwordController,
                      labelText: 'Password',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Forgetpass()),
                );
              },
              child: Align(
                alignment: const FractionalOffset(0.9, 0.9),
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
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 220,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.darkblue,
                  side: BorderSide(width: 3, color: ColorManager.darkblue),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () async {
                  try {
                    await signInWithEmailAndPassword(
                        emailController.text, passwordController.text);
                    ref.read(userDataProviderRepository.notifier).state =
                        userData.getUserDetails();
                    Navigator.pushNamed(context, 'journal');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
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
              height: 40,
            ),
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
