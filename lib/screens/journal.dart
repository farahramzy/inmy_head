import 'package:flutter/material.dart';
import 'package:inmy_head/data/journal_data.dart';
import 'package:inmy_head/screens/edit_profile.dart';
import 'package:inmy_head/screens/welcome.dart';
import '../constants/constants.dart';
import 'drawer.dart';

class Journal extends StatefulWidget {
  const Journal({super.key});

  @override
  State<Journal> createState() => _JournalState();
}

class _JournalState extends State<Journal> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final journalData = JournalData();
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      key: _globalKey,
      drawer: const NavigationDrawer(),
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  _globalKey.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu, size: FontSize.s40),
                color: ColorManager.black,
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'editProfile');
                },
                child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: ColorManager.purple3.withOpacity(0.5),
                    )),
              )
            ],
          ),
        ),
        //DISCOVER TEXT
        //make sized box to wrap text from above
        const SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
        ),
        //discover text
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Your Happy days',
            style: TextStyle(
              fontSize: FontSize.s20,
              fontWeight: FontWeightManager.bold,
            ),
          ),
        ),
        //make sized box to wrap text from above
        const SizedBox(
          height: 15,
        ),

        // tabbar
        // in the tabbar, I MUST PROVIDE A TABBAR CONTROLLER
        // step 1 in controller:  "with TickerProviderStateMixin"
        Container(
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: _tabController,
              labelColor: ColorManager.black,
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
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 10),
          height: 300,
          width: double.maxFinite,
          child: TabBarView(
            controller: _tabController,
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
                            journalData.images.values.elementAt(index));
                      },

                      child: Ink.image(
                        image: AssetImage(
                            "images/${journalData.images.keys.elementAt(index)}"),
                        width: 200,
                        height: 300,
                        padding: const EdgeInsets.all(10),
                        fit: BoxFit.cover,
                      ),
                      // child: Container(
                      //   margin: const EdgeInsets.only(right: 15, top: 10),
                      //   width: 200,
                      //   height: 300,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     color: ColorManager.white,
                      //     image: DecorationImage(
                      //       image: AssetImage(
                      //           "images/" + images.keys.elementAt(index)),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: journalData.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.face),
                    title: Text(
                      journalData.list[index],
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: journalData.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.auto_awesome),
                    title: Text(
                      journalData.list1[index],
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: journalData.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.do_disturb_alt),
                    title: Text(
                      journalData.list2[index],
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: journalData.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.add_reaction),
                    title: Text(
                      journalData.list3[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(left: 25, right: 20),
          child: Row(
            children: const [
              Text(
                'Let\'s reflect...',
                style: TextStyle(
                  fontSize: FontSize.s20,
                  fontWeight: FontWeightManager.bold,
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
//how to make a clickable
        Container(
          height: 90,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 20),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Material(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, journalData.reflect.values.elementAt(index));
                  },
                  child: Ink.image(
                    image: AssetImage(
                        "images/${journalData.image.keys.elementAt(index)}"),
                    width: 100,
                    height: 45,
                    padding: const EdgeInsets.only(top: 77, left: 20),
                    child: Text(
                      journalData.image.values.elementAt(index),
                      style: TextStyle(
                        color: ColorManager.grey,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // const SizedBox(
        //   height: 20,
        // ),
      ])),
    );
  }
}