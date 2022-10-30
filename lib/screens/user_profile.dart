import 'package:flutter/material.dart';
import 'package:inmy_head/model/user.dart';
import 'package:inmy_head/data/user_data.dart';
import '../constants/constants.dart';
import 'drawer.dart';
import '../widgets/user_profile_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> _globalKeys = GlobalKey<ScaffoldState>();

  final user = UserData.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKeys,
      drawer: const NavigationDrawer(),
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("images/124.jpg"), fit: BoxFit.cover),
          // ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKeys.currentState?.openDrawer();
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
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ProfileHeader(profileName: 'Your Profile'),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Hero(
                    tag: 'profilePicture',
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage("images/reflect.png"),
                    ),
                  ),
                ),
                ProfileText(profileText: 'Name', color: ColorManager.darkblue),
                ProfileData(
                  profileData: user.name!,
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileText(profileText: 'Email', color: ColorManager.darkblue),
                ProfileData(
                  profileData: user.email!,
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileText(
                    profileText: 'Phone Number', color: ColorManager.darkblue),
                ProfileData(
                  profileData: user.phone!,
                ),
                const SizedBox(
                  height: 20,
                ),
                ProfileText(
                    profileText: 'Birthdate', color: ColorManager.darkblue),
                ProfileData(
                  profileData: user.birthdate!,
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                            size: 50, color: ColorManager.darkblue),
                        tooltip: 'Edit your profile',
                        onPressed: () {
                          // Go to edit Profile Page
                          Navigator.pushNamed(context, 'editProfile');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
