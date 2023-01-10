import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/data/repositories/user_provider.dart';
import 'package:inmy_head/data/repositories/worry_questions_provider.dart';

import '../constants/constants.dart';
import '../data/worry_data.dart';

class WorryListView extends StatelessWidget {
  const WorryListView({
    Key? key,
    required this.controllerList,
    required this.worryData,
  }) : super(key: key);

  final List<TextEditingController> controllerList;
  final WorryData worryData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(builder: (_, ref, __) {
        return ref.watch(worryQuestionsProvider).when(
          data: (value) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.docs.length,
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
                                  value.docs[index].get('text'),
                                  style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s20,
                                      fontWeight: FontWeightManager.bold2),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextFormField(
                                controller: controllerList[index],
                                maxLines: 9,
                                decoration: InputDecoration(
                                  fillColor: ColorManager.white,
                                  labelText: 'Dive deep into your worries...',
                                  alignLabelWithHint: true,
                                  labelStyle: TextStyle(
                                    color: ColorManager.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        BorderSide(color: ColorManager.white),
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
            );
          },
          error: (Object error, StackTrace err) {
            return const Text("Error loading your Questions");
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        );
      }),
    );
  }
}
