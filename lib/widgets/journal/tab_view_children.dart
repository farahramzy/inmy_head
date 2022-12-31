import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/journal_data.dart';
import '../../data/repositories/mood_tracker_provider.dart';
import '../../model/mood_tracker_model.dart';
import 'custom_listview.dart';

class TabViewChildren extends StatefulWidget {
  const TabViewChildren(
      {super.key, required this.journalData, required this.tabController});
  final JournalData journalData;
  final TabController tabController;

  @override
  State<TabViewChildren> createState() => _TabViewChildrenState();
}

Stream moodTrackerData = MoodTrackers().getMoodTracker();
final moodTrackerProviderRepository =
    StateProvider<Stream>((ref) => moodTrackerData);

final moodTrackerProvider =
    StreamProvider(((ref) => ref.watch(moodTrackerProviderRepository)));

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
          Consumer(
            builder: (_, ref, __) {
              return ref.watch(moodTrackerProvider).when(
                data: (value) {
                  // print(value.docs);
                  // print(object)
                  List<String> listText = [];
                  List<String> listTime = [];
                  value.docs.forEach((element) {
                    Timestamp t = element.get('time');
                    DateTime time = t.toDate();
                    // print(time);
                    listText.add(element.get('Mood Text'));
                    listTime.add(
                        '${time.day}:${time.month}:${time.year} -- ${time.hour}:${time.minute}:${time.second}');
                  });
                  return CustomListView(
                    icon: const Icon(Icons.add_reaction),
                    textList: listText,
                    time: listTime,
                  );
                },
                error: (Object error, StackTrace err) {
                  return const Center(
                      child: Text("Error loading your moods..."));
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
