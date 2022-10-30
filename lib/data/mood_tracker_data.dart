import 'package:flutter/material.dart';

class MoodTrackerData {
  List<String>? moodTexts = [
    'REALLY TERRIBLE',
    'SOMEWHAT BAD',
    'COMPLETLY OKAY',
    'PRETTY GOOD',
    'SUPER AWESOME'
  ];
  List iconTypes = [
    Icons.sentiment_very_dissatisfied_sharp,
    Icons.sentiment_dissatisfied_sharp,
    Icons.sentiment_satisfied,
    Icons.sentiment_satisfied_sharp,
    Icons.sentiment_very_satisfied_sharp,
  ];
}
