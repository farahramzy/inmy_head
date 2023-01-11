import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/color_constants.dart';
import '../data/repositories/user_provider.dart';
import '../widgets/user_profile_widget.dart';
import 'drawer.dart';
import 'package:inmy_head/constants/font_constants.dart';

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key});

  @override
  ConsumerState<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  TextEditingController nameController = TextEditingController();

  final GlobalKey<ScaffoldState> _globalKeys = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      key: _globalKeys,
      drawer: const NavigationDrawer(),
      backgroundColor: ColorManager.white,
      body: userData.when(
        data: (value) => SafeArea(
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
                      color: ColorManager.secondryColor,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'journal');
                      },
                      icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                      color: ColorManager.secondryColor,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Expanded(
                    child: Center(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Hero(
                              tag: 'profilePicture',
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(value.get('Image')),
                              ),
                            ),
                          ),
                          ProfileText(
                              profileText: 'Name',
                              color: ColorManager.darkblue),
                          ProfileData(
                            profileData: "${value.get('Name')}",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ProfileText(
                              profileText: 'Email',
                              color: ColorManager.darkblue),
                          ProfileData(
                            profileData: "${value.get('Email')}",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ProfileText(
                              profileText: 'Password',
                              color: ColorManager.darkblue),
                          ProfileData(
                            profileData: "${value.get('Password')}",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ProfileText(
                              profileText: 'Phone Number',
                              color: ColorManager.darkblue),
                          ProfileData(
                            profileData: "${value.get('Phone Number')}",
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
                    ),
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (Object error, StackTrace stackTrace) =>
            const Center(child: Text('Error')),
      ),
    );
  }
}
