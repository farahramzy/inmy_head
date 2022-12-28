import 'package:flutter/material.dart';
import 'package:inmy_head/data/journal_data.dart';
import '../constants/constants.dart';
import '../widgets/journal/lets_reflect_listview.dart';
import '../widgets/journal/screen_text.dart';
import '../widgets/journal/tab_view.dart';
import '../widgets/journal/username_text.dart';
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
    return Scaffold(
      key: _globalKey,
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    /////////////////////ES2AL FARAH KHALED////////////////////////////
                    Expanded(child: Container()),
                    /////////////////////ES2AL FARAH KHALED////////////////////////////
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const UserNameText(),
              const Center(
                child: ScreenText(text: 'Your Happy days'),
              ),
              const SizedBox(
                height: 15,
              ),
              const TabView(),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 25, right: 20),
                child: const ScreenText(text: 'Let\'s reflect...'),
              ),
              LetsReflectListView(journalData: journalData),
            ],
          ),
        ),
      ),
    );
  }
}
