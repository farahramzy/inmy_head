import 'package:flutter/material.dart';

import '../constants.dart';

class ProfileHeader extends StatelessWidget {
  final String profileName;
  const ProfileHeader({
    Key? key,
    required this.profileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(profileName,
        style: TextStyle(
            letterSpacing: 1,
            fontSize: FontSize.s40,
            color: ColorManager.darkPurple,
            fontWeight: FontWeightManager.bold));
  }
}

class ProfileData extends StatelessWidget {
  final String profileData;
  const ProfileData({
    Key? key,
    required this.profileData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 40.0),
      child: Container(
        width: 400,
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: ColorManager.grey,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8),
              child: Text(
                profileData,
                style: const TextStyle(fontSize: FontSize.s20, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileText extends StatelessWidget {
  final String profileText;
  final Color color;
  const ProfileText({
    Key? key,
    required this.profileText,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            profileText,
            style: TextStyle(
              fontSize: FontSize.s18,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
