import 'package:flutter/material.dart';
import 'package:inmy_head/widgets/journal/tab_view_children.dart';
import '../../constants/color_constants.dart';
import '../../data/journal_data.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  final journalData = JournalData();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            labelPadding: const EdgeInsets.only(left: 20, right: 20),
            controller: tabController,
            labelColor: ColorManager.secondryColor,
            unselectedLabelColor: ColorManager.grey,
            isScrollable: true,
            indicatorColor: ColorManager.purple2,
            //tabs take children
            tabs: const [
              Tab(
                text: "Today's log",
              ),
              Tab(text: "Your reflections"),
              Tab(text: "Your blessings"),
              Tab(text: "Your worries"),
              Tab(text: "Your emotions"),
            ],
          ),
        ),
        TabViewChildren(journalData: journalData, tabController: tabController)
      ],
    );
  }
}
