import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/color_constants.dart';
import '../../data/repositories/user_provider.dart';
import 'package:inmy_head/constants/font_constants.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        return ref.watch(userDataProvider).when(
          data: (value) {
            return Center(
              child: Text('Welcome, ${value.get('Name')}',
                  style: TextStyle(
                    color: ColorManager.darkblue,
                    fontSize: FontSize.s25,
                    fontWeight: FontWeightManager.bold,
                  ),
                  textAlign: TextAlign.center),
            );
          },
          error: (Object error, StackTrace err) {
            return const Text("Error loading your name");
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        );
      },
    );
  }
}
