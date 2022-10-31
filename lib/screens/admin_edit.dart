import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../data/reflection_data.dart';

class AdminEdit extends StatelessWidget {
  AdminEdit({super.key});
  Reflectionata reflectionData = Reflectionata();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          //_globalKey.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu, size: FontSize.s40),
                        color: ColorManager.black,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'welcome');
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
                    'Edit Reflections',
                    style: TextStyle(
                        color: ColorManager.black,
                        fontSize: FontSize.s40,
                        fontWeight: FontWeightManager.bold),
                  ),
                ),
                const SizedBox(height: 30.0),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: reflectionData.reflectionList!.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 400,
                        child: ListTile(
                          title: SizedBox(
                            height: 100,
                            child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Color.fromARGB(255, 176, 155, 203),
                              ),
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 5, right: 5),
                                    child: Center(
                                      child: Text(
                                        reflectionData.reflectionList![index],
                                        style: const TextStyle(
                                            fontSize: FontSize.s20,
                                            fontWeight:
                                                FontWeightManager.bold2),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
