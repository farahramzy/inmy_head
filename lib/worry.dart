import 'package:flutter/material.dart';

import 'package:inmy_head/reflections2.dart';

class Worry extends StatefulWidget {
  const Worry({super.key});
  @override
  State<Worry> createState() => _WorrysState();
}

class _WorrysState extends State<Worry> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/reflect.png"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
            children: <Widget>[
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
