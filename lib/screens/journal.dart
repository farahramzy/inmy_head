import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:inmy_head/data/journal_data.dart';
import 'package:inmy_head/firebase_options.dart';
import '../constants/constants.dart';
import '../widgets/journal/lets_reflect_listview.dart';
import '../widgets/journal/screen_text.dart';
import '../widgets/journal/tab_view.dart';
import '../widgets/journal/username_text.dart';
import 'drawer.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
 

  print("Handling a background message: ${message.messageId}");
}


void notification() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);


  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
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
