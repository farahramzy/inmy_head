import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/constants.dart';
import '../data/mood_tracker_data.dart';
import '../data/repositories/user_provider.dart';
import '../model/mood_tracker_model.dart';
import '../model/user_model.dart';
import 'drawer.dart';

class MoodTracker extends StatefulWidget {
  const MoodTracker({super.key});

  @override
  State<MoodTracker> createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  final _moodTracker = MoodTrackerData();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  static double minVal = 0;
  static double maxVal = 4;
  static int valueChange = 0;

  var time = DateTime.now();
  final moodTracker = MoodTrackers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const NavigationDrawer(),
      backgroundColor: ColorManager.purple1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      color: ColorManager.white,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'journal');
                      },
                      icon: const Icon(Icons.close_sharp, size: FontSize.s40),
                      color: ColorManager.white,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer(
                    builder: (_, ref, __) {
                      return ref.watch(userDataProvider).when(
                        data: (value) {
                          return Text(
                              'Hey, ${value.get('Name')} . How are you\n this evening?',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                              ),
                              textAlign: TextAlign.center);
                        },
                        error: (Object error, StackTrace err) {
                          return const Text("Error loading your name");
                        },
                        loading: () {
                          return const CircularProgressIndicator();
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Icon(
                _moodTracker.iconTypes[valueChange],
                size: 100,
                color: ColorManager.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  _moodTracker.moodTexts![valueChange],
                  style: TextStyle(
                      fontSize: FontSize.s40, color: ColorManager.white),
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 5,
                ),
                child: Slider(
                  activeColor: ColorManager.white,
                  inactiveColor: ColorManager.grey,
                  min: minVal,
                  max: maxVal,
                  value: valueChange.toDouble(),
                  onChanged: (val) {
                    setState(
                      () {
                        valueChange = val.toInt();
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 130),
              GestureDetector(
                onTap: () {
                  setState(() {
                    time = DateTime.now();
                  });
                  moodTracker.addMoodTracker(
                    userId,
                    _moodTracker.moodTexts![valueChange],
                    '${time.day}:${time.month}:${time.year}  ${time.hour}:${time.minute}:${time.second}',
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          const Text('Your mood has been saved successfully!'),
                      duration: const Duration(milliseconds: 3000),
                      width: 300.0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 10.0,
                      ),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  );
                  Timer(const Duration(seconds: 3), () {
                    Navigator.pushNamed(context, 'journal');
                  });
                },
                child: Material(
                  borderRadius: BorderRadius.circular(100.0),
                  color: ColorManager.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80.0, vertical: 10.0),
                    child: Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: FontSize.s20,
                        color: ColorManager.purple2,
                        fontWeight: FontWeightManager.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
