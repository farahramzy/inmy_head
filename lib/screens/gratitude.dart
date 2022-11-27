import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../data/gratitude_data.dart';
import 'drawer.dart';

class Gratitude extends StatefulWidget {
  const Gratitude({super.key});

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final gratitudeData = GratitudeData();

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
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: gratitudeData.gratitudeList!.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 400,
                        child: ListTile(
                          title: SizedBox(
                            height: 350,
                            child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: ColorManager.purple3,
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 10, right: 5),
                                    child: Center(
                                      child: Text(
                                        gratitudeData.gratitudeList![index],
                                        style: TextStyle(
                                            color: ColorManager.white,
                                            fontSize: FontSize.s20,
                                            fontWeight:
                                                FontWeightManager.bold2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: TextFormField(
                                      onTap: () {},
                                      maxLines: 9,
                                      decoration: InputDecoration(
                                        fillColor: ColorManager.white,
                                        labelText:
                                            'Take a few moments to be grateful',
                                        alignLabelWithHint: true,
                                        labelStyle: TextStyle(
                                          color: ColorManager.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide(
                                              color: ColorManager.white),
                                        ),
                                        hintText: 'Type your answer...',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40, //height of button
                  width: 100, //width of button
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorManager.darkPurple,
                        side: BorderSide(
                            width: 3, color: ColorManager.darkPurple),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(10)),
                    onPressed: () {
                      //save to firebase and go to journal page
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
