import 'package:flutter/material.dart';
import 'package:inmy_head/reflections/reflections2.dart';

class Reflections extends StatefulWidget {
  const Reflections({super.key});
  @override
  State<Reflections> createState() => _ReflectionsState();
}

class _ReflectionsState extends State<Reflections> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/reflect2.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
            children: <Widget>[
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(
                      text:
                          "What is the most interesting \n thing you learned today?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "What inpspired you today?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "What are your goals for tommorow?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(
                      text:
                          "What is the one thing you could've \n done better today?"),
                ],
              ),
              Stack(
                children: const <Widget>[
                  Cont2(),
                  TextPage(text: "What was your favorite part of the day?"),
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
