import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../data/repositories/user.dart';
import '../widgets/user_profile_widget.dart';
import 'drawer.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController nameController = TextEditingController();

  final GlobalKey<ScaffoldState> _globalKeys = GlobalKey<ScaffoldState>();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKeys,
      drawer: const NavigationDrawer(),
      backgroundColor: ColorManager.white,
      body: SafeArea(
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
                      Navigator.pushNamed(context, 'journal');
                    },
                    icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                    color: ColorManager.black,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('id', isEqualTo: userId)
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data = snapshot.data!.docs[index];
                          return Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Hero(
                                    tag: 'profilePicture',
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          NetworkImage("${data['Image']}"),
                                    ),
                                  ),
                                ),
                                ProfileText(
                                    profileText: 'Name',
                                    color: ColorManager.darkblue),
                                ProfileData(
                                  profileData: "${data['Name']}",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ProfileText(
                                    profileText: 'Email',
                                    color: ColorManager.darkblue),
                                ProfileData(
                                  profileData: "${data['Email']}",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ProfileText(
                                    profileText: 'Password',
                                    color: ColorManager.darkblue),
                                ProfileData(
                                  profileData: "${data['Password']}",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ProfileText(
                                    profileText: 'Phone Number',
                                    color: ColorManager.darkblue),
                                ProfileData(
                                  profileData: "${data['Phone Number']}",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ProfileText(
                                    profileText: 'Birthdate',
                                    color: ColorManager.darkblue),
                                const ProfileData(
                                  profileData: '22/7/2001',
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),

              ///////////////////////////////////
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
                        // updateUserDetails();
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
    );
  }
}
