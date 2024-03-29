import 'package:flutter/material.dart';
import 'package:inmy_head/constants/color_constants.dart';
import 'drawer.dart';
import '../widgets/affirmations_box.dart';
import 'package:inmy_head/constants/font_constants.dart';

class Affirmations extends StatelessWidget {
  const Affirmations({super.key});

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
        backgroundColor: const Color.fromARGB(196, 187, 160, 222),
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
              const SizedBox(
                height: 50,
              ),
              const Text(
                'POSITIVE AFFIRMATIONS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeightManager.w800,
                    fontSize: FontSize.s40),
              ),
              const SizedBox(
                height: 40,
              ),
              const AffirmationBox(text: "affirmation1"),
              const SizedBox(
                height: 20,
              ),
              const AffirmationBox(text: "affirmation2"),
              const SizedBox(
                height: 20,
              ),
              const AffirmationBox(text: "affirmation3"),
            ],
          ),
        ),
      ),
    );
  }
}
