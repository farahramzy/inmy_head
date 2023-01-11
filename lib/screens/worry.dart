// ignore_for_file: unused_import
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inmy_head/data/worry_data.dart';
import 'package:inmy_head/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/color_constants.dart';
import '../data/user_data.dart';
import '../widgets/worry/add_worry_listview.dart';
import 'drawer.dart';
import 'package:inmy_head/constants/font_constants.dart';

class Worry extends StatefulWidget {
  const Worry({super.key});
  @override
  State<Worry> createState() => _WorrysState();
}

class _WorrysState extends State<Worry> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final worryData = WorryData();
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
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/5.png"), fit: BoxFit.cover),
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
                    'Log a Worry',
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
                WorryListView(
                    controllerList: controllerList, worryData: worryData),
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
                      worryData.addWorry(
                          userId, controllerList.map((e) => e.text).toList());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'Your worry has been saved successfully!'),
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
