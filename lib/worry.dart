import 'package:flutter/material.dart';
import 'package:inmy_head/reflections/reflections2.dart';
import 'constants.dart';
import 'navigation_drawer/drawer.dart';

class Worry extends StatefulWidget {
  const Worry({super.key});
  @override
  State<Worry> createState() => _WorrysState();
}

class _WorrysState extends State<Worry> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/reflect.png"), fit: BoxFit.cover)),
        child: Scaffold(
          key: _globalKey,
          drawer: const NavigationDrawer(),
          backgroundColor: Colors.transparent,
          body: PageView(
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.all(15.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //         onPressed: () {
              //           _globalKey.currentState?.openDrawer();
              //         },
              //         icon: const Icon(Icons.menu, size: FontSize.s40),
              //         color: ColorManager.white,
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           Navigator.pushNamed(context, 'homePage');
              //         },
              //         icon: const Icon(Icons.close_sharp, size: FontSize.s40),
              //         color: ColorManager.white,
              //       ),
              //     ],
              //   ),
              // ),
              Stack(
                children: const <Widget>[
                  Cont1(),
                  TextPage(text: "Is it that serious?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont1(),
                  TextPage(text: "Is there a solution?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont1(),
                  TextPage(text: "Is it out of your control?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont1(),
                  TextPage(text: "Have you overcome worse?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont1(),
                  TextPage(
                      text:
                          "What are the tools to help you get \n through this?"),
                  Button(),
                ],
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
