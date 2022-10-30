import 'package:flutter/material.dart';
import '../constants.dart';
import 'build_header.dart';
import 'build_menu_item.dart';
import 'selected_item.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    const title = 'In my head';
    const title2 = 'Journal';

    return SafeArea(
      child: Drawer(
        child: Material(
          color: ColorManager.darkPurple,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'userProfile');
                      },
                      child: const Hero(
                        tag: 'profilePicture',
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/reflect.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildMenuItem(
                text: 'Log a worry',
                icon: Icons.psychology,
                iconColor: ColorManager.blue,
                onClicked: () => selectedItem(context, 0),
              ),
              buildMenuItem(
                text: 'Add a gratitude',
                icon: Icons.draw,
                iconColor: ColorManager.grey,
                onClicked: () => selectedItem(context, 1),
              ),
              buildMenuItem(
                text: 'Reflect',
                icon: Icons.emoji_objects_outlined,
                iconColor: ColorManager.white,
                onClicked: () => selectedItem(context, 2),
              ),
              buildMenuItem(
                text: 'Mood tracker',
                icon: Icons.check_box_rounded,
                iconColor: ColorManager.green,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 15),
              Divider(color: ColorManager.white),
              buildHeader(
                title: title2,
                onClicked: () => selectedItem(context, 8),
              ),
              buildMenuItem(
                text: 'Your reflections',
                icon: Icons.psychology_outlined,
                iconColor: ColorManager.pinkShadow600,
                // onClicked: () => selectedItem(context, 4),
              ),
              buildMenuItem(
                text: 'Your worries',
                icon: Icons.mood,
                iconColor: ColorManager.yellowShdow600,
                // onClicked: () => selectedItem(context, 5),
              ),
              buildMenuItem(
                text: 'Your gratitude journal',
                icon: Icons.menu_book,
                iconColor: ColorManager.red,
                // onClicked: () => selectedItem(context, 6),
              ),
              buildMenuItem(
                text: 'Your moods',
                icon: Icons.favorite_border,
                iconColor: ColorManager.white,
                // onClicked: () => selectedItem(context, 7),
              ),
              Divider(color: ColorManager.white),
              buildMenuItem(
                text: 'Affirmations',
                icon: Icons.star_border,
                iconColor: ColorManager.beigYellow,
                onClicked: () => selectedItem(context, 8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
