import 'package:flutter/material.dart';
import 'package:inmy_head/screens/drawer_admin.dart';
import '../constants/color_constants.dart';
import 'drawer_admin.dart';
import '../widgets/admin_box.dart';
import 'package:inmy_head/constants/font_constants.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});
  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const NavigationDrawer1(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/12.png"), fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            //
            body: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
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
                      // IconButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, 'journal');
                      //   },
                      //   icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                      //   color: ColorManager.secondryColor,
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70, top: 40),
                  child: Text(
                    'Edit Questions?',
                    style: TextStyle(
                        color: ColorManager.secondryColor,
                        fontSize: FontSize.s40,
                        fontWeight: FontWeightManager.bold),
                  ),
                ),
                Align(
                  alignment: const FractionalOffset(0.40, 0.40),
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: const BoxDecoration(
                        color: Color(0xffD1E5FF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        )),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AdminBox(
                            text: 'Reflect',
                            button: () {
                              Navigator.pushNamed(context, 'editReflect');
                            }),
                        AdminBox(
                            text: 'Worries',
                            button: () {
                              Navigator.pushNamed(context, 'editWorry');
                            }),
                        AdminBox(
                            text: 'Gratitude',
                            button: () {
                              Navigator.pushNamed(context, 'editGratitude');
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
