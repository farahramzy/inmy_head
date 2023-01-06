import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../data/gratitude_data.dart';

class add_gratitude_listview extends StatelessWidget {
  const add_gratitude_listview({
    Key? key,
    required this.controllerList,
    required this.gratitudeData,
  }) : super(key: key);

  final GratitudeData gratitudeData;
  final List<TextEditingController> controllerList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controllerList.length,
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
                        padding:
                            const EdgeInsets.only(top: 15, left: 10, right: 5),
                        child: Center(
                          child: Text(
                            gratitudeData.gratitudeList![index],
                            style: TextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                                fontWeight: FontWeightManager.bold2),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextFormField(
                          controller: controllerList[index],
                          maxLines: 9,
                          decoration: InputDecoration(
                            fillColor: ColorManager.white,
                            labelText: 'Take a few moments to be grateful',
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(
                              color: ColorManager.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: ColorManager.white),
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
    );
  }
}
