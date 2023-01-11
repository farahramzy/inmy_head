import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class CustomListViewForMood extends StatelessWidget {
  const CustomListViewForMood({
    Key? key,
    required this.textList,
    required this.icon,
    required this.time,
  }) : super(key: key);

  final List<String> textList;
  final List<String>? time;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: textList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: icon,
          title: Text(
            textList[index],
          ),
          trailing: time == null
              ? null
              : Text(
                  time![index],
                  style: TextStyle(
                    color: ColorManager.grey,
                  ),
                ),
        );
      },
    );
  }
}
