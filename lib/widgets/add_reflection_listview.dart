import 'package:flutter/material.dart';
import 'package:inmy_head/constants/constants.dart';
import 'package:inmy_head/data/reflection_data.dart';

class AddReflectionListView extends StatelessWidget {
  const AddReflectionListView({
    Key? key,
    required this.controllerList,
    required this.reflectionData,
  }) : super(key: key);

  final Reflectionata reflectionData;
  final List<TextEditingController> controllerList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 320,
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
                            reflectionData.reflectionList![index],
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s20,
                              fontWeight: FontWeightManager.bold2,
                            ),
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
                            labelText: 'Take a few moments reflect...',
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
