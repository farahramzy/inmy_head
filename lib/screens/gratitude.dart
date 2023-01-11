import 'dart:async';
import 'package:inmy_head/constants/font_constants.dart';
import 'package:flutter/material.dart';
import 'package:inmy_head/widgets/gratitude/add_gratitude_listview.dart';
import '../constants/color_constants.dart';
import '../data/gratitude_data.dart';
import '../data/user_data.dart';
import 'drawer.dart';

class Gratitude extends StatefulWidget {
  const Gratitude({super.key});

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final addGratitude = GratitudeData();
  List<TextEditingController> controllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const NavigationDrawer(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/3.png"), fit: BoxFit.cover),
          ),
          child: Form(
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
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Gratitude',
                    style: TextStyle(
                      fontSize: FontSize.s40,
                      fontWeight: FontWeightManager.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 9.0,
                          color: Colors.grey,
                          offset: Offset(3.0, 3.0),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 60.0),
                AddGratitudeListView(
                  controllerList: controllerList,
                ),
                SizedBox(
                  height: 40, //height of button
                  width: 100, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primaryColor,
                        side: BorderSide(
                            width: 3, color: ColorManager.primaryColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10)),
                    onPressed: () {
                      addGratitude.addGratitude(
                          userId, controllerList.map((e) => e.text).toList());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'Your gratitude has been saved successfully!'),
                          duration: const Duration(milliseconds: 3000),
                          width: 300.0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10.0,
                          ),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                      Timer(const Duration(seconds: 3), () {
                        Navigator.pushNamed(context, 'journal');
                      });
                    },
                    child: const Text(
                      'Save',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeightManager.bold,
                          fontSize: FontSize.s15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
