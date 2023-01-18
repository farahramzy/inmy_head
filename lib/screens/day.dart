import 'package:flutter/material.dart';
import '../constants/color_constants.dart';
import 'drawer.dart';
import 'package:inmy_head/constants/font_constants.dart';

class Day extends StatefulWidget {
  const Day({super.key});

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/orangeBackground.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        key: globalKey,
        drawer: const NavigationDrawer(),
        backgroundColor: ColorManager.beige,
        // backgroundColor: ColorManager.beige,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        globalKey.currentState?.openDrawer();
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
                padding: EdgeInsets.all(20),
                child: Text(
                  '31/10/2022',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 0, 4),
                      fontWeight: FontWeightManager.w800,
                      fontSize: FontSize.s30),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Today I had a Mobile development project discussion. However, this app helped me overcome my anxiety a lot!',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeightManager.w800,
                      fontSize: FontSize.s20),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
