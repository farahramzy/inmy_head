import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/color_constants.dart';
import '../data/reflection_data.dart';
import '../data/repositories/reflection_questions_provider.dart';
import 'package:inmy_head/constants/font_constants.dart';

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
            child: SingleChildScrollView(
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
                          color: ColorManager.secondryColor,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'admin');
                          },
                          icon:
                              const Icon(Icons.close_sharp, size: FontSize.s40),
                          color: ColorManager.secondryColor,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      'Edit Reflections',
                      style: TextStyle(
                          color: ColorManager.secondryColor,
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
                            height: 500,
                            width: double.infinity,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: value.docs.length,
                                itemBuilder: (context, index) {
                                  String newText =
                                      value.docs[index].get('text');
                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: SizedBox(
                                          height: 300,
                                          child: Container(
                                            width: 360,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                              color: const Color.fromARGB(
                                                  255, 176, 155, 203),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 10.0),
                                              child: TextFormField(
                                                  maxLines: 2,
                                                  initialValue: value
                                                      .docs[index]
                                                      .get('text'),
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
                                                          FontWeightManager
                                                              .bold2),
                                                  onChanged: (newVal) {
                                                    newText = newVal;
                                                  }),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection(
                                                      "Reflection Question")
                                                  .doc(value.docs[index].id)
                                                  .set({'text': newText});
                                            },
                                            child: const Text('Save'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          );
                        },
                        error: (Object error, StackTrace err) {
                          return const Text("Error loading your questions");
                        },
                        loading: () {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
