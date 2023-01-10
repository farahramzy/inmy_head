import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/constants.dart';
import '../data/reflection_data.dart';
import '../data/repositories/reflection_questions_provider.dart';

class EditReflection extends StatefulWidget {
  const EditReflection({super.key});

  @override
  State<EditReflection> createState() => _EditReflectionState();
}

class _EditReflectionState extends State<EditReflection> {
  final Reflectionata reflectionData = Reflectionata();

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
                const SizedBox(height: 10.0),
                Consumer(
                  builder: (_, ref, __) {
                    return ref.watch(reflectionQuestionsProvider).when(
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
                                                255, 176, 155, 203),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 10.0),
                                            child: TextFormField(
                                                maxLines: 2,
                                                initialValue: value.docs[index]
                                                    .get('text'),
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Enter your reflection',
                                                  hintStyle: TextStyle(
                                                      color: ColorManager.black,
                                                      fontSize: FontSize.s20,
                                                      fontWeight:
                                                          FontWeightManager
                                                              .bold2),
                                                ),
                                                style: TextStyle(
                                                    color: ColorManager.black,
                                                    fontSize: FontSize.s20,
                                                    fontWeight:
                                                        FontWeightManager
                                                            .bold2),

                                                // onChanged: (value) {
                                                //   // reflectionData.reflection = value;
                                                // },

                                                // update automatically on changes without needing a button
                                                onChanged: (newValue) => value
                                                    .document(value
                                                        .docs[index].documentID)
                                                    .updateData(
                                                        {'text': newValue})),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                          //SAVE BUTTON to reload the page
                          //how to code a save button that reloads page on

                          // ElevatedButton(
                          //     onPressed: (context) => Navigator.pop(context),
                          //     child: const Text("save")
                          //     )
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