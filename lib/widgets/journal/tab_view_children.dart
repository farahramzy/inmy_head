import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/journal_data.dart';
import '../../data/repositories/gratitude_questions_provider.dart';
import '../../data/repositories/mood_tracker_provider.dart';
import '../../data/repositories/reflection_questions_provider.dart';
import '../../data/repositories/worry_questions_provider.dart';
import 'custom_listview.dart';
import 'custom_listview_mood.dart';

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
            itemCount: 3,
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

          Consumer(
            builder: (_, ref, __) {
              return ref.watch(reflectionDataProvider).when(
                data: (value) {
                  List<String> listReflectionFirstData = [];
                  List<List<String>> cardsDataList = [];

                  value.docs.forEach((element) {

                    List<dynamic>? reflectionData = element.get('ans');
                    if (reflectionData != null && reflectionData.isNotEmpty) {
                      List<String> listReflectionData = [];

                      listReflectionFirstData.add(reflectionData.first);

                      for (var element in reflectionData) {
                        if (element is String) {
                          listReflectionData.add(element);
                        }
                      }
                      cardsDataList.add(listReflectionData);
                    } else {
                      listReflectionFirstData
                          .add('No data provided in your reflection list');
                    }
                  });
                  return CustomListView(
                    icon: const Icon(Icons.face),
                    textListData: cardsDataList,
                    time: null,
                    onTap: () {},
                  );
                },
                error: (Object error, StackTrace err) {
                  return const Center(
                    child: Text("Error loading your reflections..."),
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
          ////////////////////
          Consumer(
            builder: (_, ref, __) {
              return ref.watch(gratitudeDataProvider).when(
                data: (value) {
                  List<String> listGratitudeFirstData = [];
                  List<List<String>> cardsDataList = [];

                  value.docs.forEach((element) {
                    List<dynamic>? gratitudenData = element.get('ans');
                    if (gratitudenData != null && gratitudenData.isNotEmpty) {
                      List<String> listGratitudeData = [];
                      listGratitudeFirstData.add(gratitudenData.first);

                      for (var element in gratitudenData) {
                        if (element is String) {
                          listGratitudeData.add(element);
                        }
                      }
                      cardsDataList.add(listGratitudeData);
                    } else {
                      listGratitudeFirstData
                          .add('No data provided in your gratitude list');
                    }
                  });
                  return CustomListView(
                    icon: const Icon(Icons.face),
                    textListData: cardsDataList,
                    time: null,
                    onTap: () {},
                  );
                },
                error: (Object error, StackTrace err) {
                  return const Center(
                    child: Text("Error loading your gratitude..."),
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
          ////////////////////
          Consumer(
            builder: (_, ref, __) {
              return ref.watch(worryDataProvider).when(
                data: (value) {
                  List<String> listWorryFirstData = [];
                  List<List<String>> cardsDataList = [];

                  value.docs.forEach((element) {
                    List<dynamic>? worryData = element.get('ans');
                    if (worryData != null && worryData.isNotEmpty) {
                      List<String> listWorryData = [];

                      listWorryFirstData.add(worryData.first);

                      for (var element in worryData) {
                        if (element is String) {
                          listWorryData.add(element);
                        }
                      }
                      cardsDataList.add(listWorryData);
                    } else {
                      listWorryFirstData
                          .add('No data provided in your worry list');
                    }
                  });
                  return CustomListView(
                    icon: const Icon(Icons.face),
                    textListData: cardsDataList,
                    time: null,
                    onTap: () {},
                  );
                },
                error: (Object error, StackTrace err) {
                  return const Center(
                    child: Text("Error loading your worries..."),
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
          //////////////////////////////
          Consumer(
            builder: (_, ref, __) {
              return ref.watch(moodTrackerProvider).when(
                data: (value) {
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
                  return CustomListViewForMood(
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
