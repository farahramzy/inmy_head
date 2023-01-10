// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    Key? key,
    required this.icon,
    required this.time,
    required this.textListData,
    this.height,
    this.onTap,
    ListView? child,
  }) : super(key: key);

  final List<List<String>> textListData;
  final List<String>? time;
  final Icon icon;
  final double? height;
  final void Function()? onTap;

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: widget.textListData.length,
      itemBuilder: (BuildContext context, int index) {
        List<Widget> tilesList = [];
        for (var element in widget.textListData[index]
            .getRange(1, widget.textListData[index].length)) {
          tilesList.add(
            Container(
              color: ColorManager.purple1,
              child: ListTile(
                title: Text(
                  element,
                  style: TextStyle(color: ColorManager.white),
                ),
              ),
            ),
          );
        }
        return Card(
          child: ExpansionTile(
            title: ListTile(
              leading: widget.icon,
              title: Text(
                widget.textListData[index].first,
                style: TextStyle(
                  color: index == selectedIndex
                      ? Colors.white
                      : ColorManager.black,
                ),
              ),
              trailing: widget.time == null
                  ? null
                  : Text(
                      widget.time![index],
                    ),
            ),
            children: tilesList,
          ),
        );
      },
    );
  }
}
