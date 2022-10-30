import 'package:flutter/material.dart';
import '../constants/constants.dart';
import 'drawer.dart';
import '../widgets/edit_profile_widget.dart';
import '../widgets/user_profile_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      key: _globalKey,
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("images/125.jpg"), fit: BoxFit.cover),
          // ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu, size: FontSize.s40),
                      color: ColorManager.black,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'homePage');
                      },
                      icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                      color: ColorManager.black,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 10),
                        child: ProfileHeader(profileName: 'Edit Profile'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 10),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: AssetImage("images/reflect.png"),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileText(
                              profileText: 'Name', color: ColorManager.black),
                          const SizedBox(height: 5.0),
                          const EditFormField(formFieldText: 'Your Name'),
                          ProfileText(
                              profileText: 'Email', color: ColorManager.black),
                          const SizedBox(height: 5.0),
                          const EditFormField(formFieldText: 'Your Email'),
                          ProfileText(
                              profileText: 'Phone Number',
                              color: ColorManager.black),
                          const SizedBox(height: 5.0),
                          const EditFormField(
                              formFieldText: 'Your Phone Number'),
                        ],
                      ),
                      SizedBox(
                        width: 100.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.darkPurple,
                            // side: BorderSide(
                            //     width: 3, color: ColorManager.darkblue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(8),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'userProfile');
                            // AND Save data in database
                          },
                          child: Text(
                            'Save',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeightManager.bold,
                                fontSize: FontSize.s25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
