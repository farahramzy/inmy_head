import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/user_provider.dart';
import '../constants/color_constants.dart';
import '../widgets/drawer/build_header.dart';
import '../widgets/drawer/build_menu_item.dart';
import '../widgets/drawer/selected_item_admin.dart';

class NavigationDrawer1 extends StatelessWidget {
  const NavigationDrawer1({super.key});
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    const title = 'In my head';
    const title2 = 'Journal';

    return SafeArea(
      child: Drawer(
        child: Material(
          color: ColorManager.primaryColor,
          child: ListView(
            padding: padding,
            children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildHeader(
                      title: title,
                      onClicked: () => selectedItem(context, 8),
                    ),
                    Consumer(
                      builder: (_, ref, __) {
                        return ref.watch(userDataProvider).when(
                          data: (value) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'userProfile');
                              },
                              child: Hero(
                                tag: 'profilePicture',
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      NetworkImage(value.get('Image')),
                                ),
                              ),
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
                    ),
                  ],
                ),
              ),
              buildMenuItem(
                text: 'Edit Worry Questions',
                icon: Icons.psychology,
                iconColor: ColorManager.blue,
                onClicked: () => selectedItem(context, 0),
              ),
              buildMenuItem(
                text: 'Edit Gratitude Questions',
                icon: Icons.draw,
                iconColor: ColorManager.grey,
                onClicked: () => selectedItem(context, 1),
              ),
              buildMenuItem(
                text: 'Edit Reflection Questions',
                icon: Icons.emoji_objects_outlined,
                iconColor: ColorManager.white,
                onClicked: () => selectedItem(context, 2),
              ),
              buildMenuItem(
                text: 'Sign Out',
                icon: Icons.logout_rounded,
                iconColor: Colors.red,
                onClicked: () => selectedItem(context, 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
