import 'package:flutter/material.dart';

import '../../data/journal_data.dart';
import 'lets_reflect.dart';

class LetsReflectListView extends StatelessWidget {
  const LetsReflectListView({
    Key? key,
    required this.journalData,
  }) : super(key: key);

  final JournalData journalData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return LetsReflect(
            text: journalData.image.values.elementAt(index),
            imagePath: "images/${journalData.image.keys.elementAt(index)}",
            screenPath: journalData.reflect.values.elementAt(index),
          );
        },
      ),
    );
  }
}
