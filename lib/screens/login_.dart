import 'package:flutter/material.dart';
import 'package:inmy_head/screens/signup_.dart';
import '../constants/constants.dart';
import 'forget_.dart';
import '../model/login_model.dart';
// import '../admin/admin.dart';

class LoginC extends StatefulWidget {
  const LoginC({super.key});

  @override
  State<LoginC> createState() => _LoginCState();
}

class _LoginCState extends State<LoginC> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        controller: emailController,
                        validator: (emailController) {
                          if (emailController != null &&
                              emailController.isNotEmpty &&
                              emailController == loginModel.username) {
                            Navigator.pushNamed(context, 'homePage');
                            return null;
                          } else {
                            return 'Please enter Email';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 10,
                                color: Color.fromARGB(255, 12, 12, 12)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: "*",
                        validator: (passwordController) {
                          if (passwordController != null &&
                              passwordController.isNotEmpty &&
                              passwordController == loginModel.password) {
                            Navigator.pushNamed(context, 'homePage');
                            return null;
                          } else {
                            return 'Please enter Password';
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Password',
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
              height: 40, //height of button
              width: 220, //width of button
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ColorManager.darkblue,
                    side: BorderSide(width: 3, color: ColorManager.darkblue),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(10)),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')));
                    _formKey.currentState!.save();
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
