import 'package:flutter/material.dart';
import '../../data/journal_data.dart';
import 'custom_listview.dart';

class TabViewChildren extends StatefulWidget {
  const TabViewChildren(
      {super.key, required this.journalData, required this.tabController});
  final JournalData journalData;
  final TabController tabController;

  @override
  State<TabViewChildren> createState() => _TabViewChildrenState();
}

class _TabViewChildrenState extends State<TabViewChildren> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10),
      height: 300,
      width: double.maxFinite,
      child: TabBarView(
        controller: widget.tabController,
        children: [
          ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                borderRadius: BorderRadius.circular(28),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context,
                        widget.journalData.images.values.elementAt(index));
                  },
                  child: Ink.image(
                    image: AssetImage(
                        "images/${widget.journalData.images.keys.elementAt(index)}"),
                    width: 200,
                    height: 300,
                    padding: const EdgeInsets.all(10),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          CustomListView(
            icon: const Icon(Icons.face),
            textList: widget.journalData.list,
            time: null,
          ),
          CustomListView(
            icon: const Icon(Icons.auto_awesome),
            textList: widget.journalData.list1,
            time: null,
          ),
          CustomListView(
            icon: const Icon(Icons.do_disturb_alt),
            textList: widget.journalData.list2,
            time: null,
          ),
          CustomListView(
            icon: const Icon(Icons.do_disturb_alt),
            textList: widget.journalData.list3,
            time: null,
          ),
        ],
      ),
    );
  }
}
