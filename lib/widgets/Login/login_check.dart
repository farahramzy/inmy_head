// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/constants.dart';
import '../../data/repositories/user_provider.dart';
import '../../model/user_model.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.ref,
    required this.userData,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final WidgetRef ref;
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            final value = await ref.read(userDataProviderRepository);
            String userRole = value.get('userRole');
            if (userRole == 'admin') {
              Navigator.pushNamed(context, 'admin');
            } else if (userRole == 'user') {
              Navigator.pushNamed(context, 'journal');
            }
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
              fontWeight: FontWeightManager.bold, fontSize: FontSize.s15),
        ),
      ),
    );
  }
}