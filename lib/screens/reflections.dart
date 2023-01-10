import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inmy_head/model/user_model.dart';
import 'package:inmy_head/widgets/add_reflection_listview.dart';
import '../constants/constants.dart';
import '../model/reflections_model.dart';
import 'drawer.dart';
import '../data/reflection_data.dart';

class Reflections extends StatefulWidget {
  const Reflections({super.key});
  @override
  State<Reflections> createState() => _ReflectionsState();
}

class _ReflectionsState extends State<Reflections> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final reflectionData = Reflectionata();
  final addReflection = ReflectionModel();
  List<TextEditingController> controllerList = [
    TextEditingController(),
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
                image: AssetImage("images/4.png"), fit: BoxFit.cover),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Reflections',
                    style: TextStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s40,
                      fontWeight: FontWeightManager.bold,
                      shadows: const [
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
                AddReflectionListView(
                    controllerList: controllerList,
                    reflectionData: reflectionData),
                SizedBox(
                  height: 40, //height of button
                  width: 100, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.darkPurple,
                        side: BorderSide(
                            width: 3, color: ColorManager.darkPurple),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10)),
                    onPressed: () {
                      addReflection.addReflection(
                          userId, controllerList.map((e) => e.text).toList());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'Your reflection has been saved successfully!'),
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
