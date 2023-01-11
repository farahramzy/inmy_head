import 'package:flutter/material.dart';
import 'package:inmy_head/constants/font_constants.dart';
import '../constants/color_constants.dart';
import '../widgets/homepage_buttons.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const NavigationDrawer(),
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -430,
              left: -330,
              right: -300,
              child: Container(
                height: 930,
                width: 1050,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/orangeBackground.png',
                      // width: 180, height: 180
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 8,
              child: IconButton(
                onPressed: () {
                  _globalKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu, size: FontSize.s40),
                color: ColorManager.white,
              ),
            ),
            const Positioned(
              top: 60,
              left: 20,
              child: SizedBox(
                height: 180,
                width: 200,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'How are you\nfeeling today?',
                    style: TextStyle(
                        fontSize: FontSize.s30,
                        fontWeight: FontWeightManager.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 22,
              child: SizedBox(
                height: 180,
                width: 350,
                child: Row(
                  children: const [
                    Text(
                      '☺️',
                      style: TextStyle(fontSize: FontSize.s30),
                    ),
                    Text(
                      '------------',
                      style: TextStyle(fontSize: FontSize.s70),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 290,
              child: Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    // image:image,
                    image: AssetImage(
                      'images/mirrorScreen.png',
                      // width: 180, height: 180
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 190,
              left: 100,
              child: Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'images/head.png',
                      // width: 180, height: 180
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 305,
              left: 70,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 100,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'reflections');
                    },
                    child: Container(
                      width: 250,
                      height: 95,
                      padding: const EdgeInsets.all(5.0),
                      // alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: ColorManager.beige,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Column(children: const [
                            Text('Add a thought',
                                style: TextStyle(
                                  fontWeight: FontWeightManager.bold,
                                  fontSize: FontSize.s25,
                                )),
                            // SizedBox(height: 5),
                            Text('_____________________________________'),
                            SizedBox(height: 5),
                            Text('I value --- over anything',
                                style: TextStyle(
                                  fontSize: FontSize.s15,
                                  fontWeight: FontWeightManager.bold,
                                )),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 450,
              left: 70,
              child: Column(
                children: [
                  ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(240, 52))),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        HomePageButtons(
                          'Log a worry',
                          onPressed: () {
                            Navigator.pushNamed(context, 'worry');
                          },
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        HomePageButtons(
                          'Add a gratitude',
                          onPressed: () {
                            Navigator.pushNamed(context, 'gratitude');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
