import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/data/journal_data.dart';
import 'package:inmy_head/firebase_options.dart';
import '../data/repositories/user_provider.dart';
import '../constants/color_constants.dart';
import '../widgets/journal/lets_reflect_listview.dart';
import '../widgets/journal/screen_text.dart';
import '../widgets/journal/tab_view.dart';
import '../widgets/journal/username_text.dart';
import 'drawer.dart';
import 'package:inmy_head/constants/font_constants.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void notification() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {}
  });
  runApp(const Journal());
}

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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu, size: FontSize.s40),
                      color: ColorManager.secondryColor,
                    ),
                    Consumer(
                      builder: (_, ref, __) {
                        return ref.watch(userDataProvider).when(
                          data: (value) {
                            return CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(value.get('Image')),
                            );
                          },
                          error: (Object error, StackTrace err) {
                            return const Text("Error loading your Image");
                          },
                          loading: () {
                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const UserNameText(),
              const Center(
                child: ScreenText(text: 'Get Inside your Head'),
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
