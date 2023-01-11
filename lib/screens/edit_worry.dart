import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/color_constants.dart';
import '../data/reflection_data.dart';
import '../data/repositories/worry_questions_provider.dart';
import 'package:inmy_head/constants/font_constants.dart';

class EditWorry extends StatefulWidget {
  const EditWorry({super.key});

  @override
  State<EditWorry> createState() => _EditWorryState();
}

class _EditWorryState extends State<EditWorry> {
  final Reflectionata reflectionData = Reflectionata();
  final GlobalKey<ScaffoldState> _globalKeys = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKeys,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKeys.currentState?.openDrawer();
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
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Edit Worry',
                    style: TextStyle(
                        color: ColorManager.secondryColor,
                        fontSize: FontSize.s40,
                        fontWeight: FontWeightManager.bold),
                  ),
                ),
                const SizedBox(height: 10.0),
                Consumer(
                  builder: (_, ref, __) {
                    return ref.watch(worryQuestionsProvider).when(
                      data: (value) {
                        return SizedBox(
                          height: 460,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: value.docs.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: SizedBox(
                                        height: 100,
                                        child: Container(
                                          width: 400,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(35.0),
                                            color: const Color.fromARGB(
                                                255, 223, 140, 140),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 10.0),
                                            child: TextFormField(
                                              maxLines: 2,
                                              initialValue:
                                                  value.docs[index].get('text'),
                                              decoration: InputDecoration(
                                                hintText:
                                                    'Enter your reflection',
                                                hintStyle: TextStyle(
                                                    color: ColorManager
                                                        .secondryColor,
                                                    fontSize: FontSize.s20,
                                                    fontWeight:
                                                        FontWeightManager
                                                            .bold2),
                                              ),
                                              style: TextStyle(
                                                  color: ColorManager
                                                      .secondryColor,
                                                  fontSize: FontSize.s20,
                                                  fontWeight:
                                                      FontWeightManager.bold2),
                                              // onChanged: (value) {
                                              //   // reflectionData.reflection = value;
                                              // },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                          //SAVE BUTTON
                        );
                      },
                      error: (Object error, StackTrace err) {
                        return const Text("Error loading your questions");
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
