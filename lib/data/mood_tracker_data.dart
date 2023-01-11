import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:inmy_head/data/user_data.dart';

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

  Future addMoodTracker(String userId, String moodText, var time) async {
    await FirebaseFirestore.instance.collection('Mood Tracker').add({
      'id': userId,
      'Mood Text': moodText,
      'time': time,
    });
  }

  // Future getMoodTracker() async {
  //   final QuerySnapshot moodTracker = await FirebaseFirestore.instance
  //       .collection('Mood Tracker')
  //       .where('id', isEqualTo: userId)
  //       .orderBy('time', descending: false)
  //       .get();
  //   return moodTracker;
  // }

  Stream<QuerySnapshot> getMoodTracker() {
    return FirebaseFirestore.instance
        .collection('Mood Tracker')
        .where('id', isEqualTo: userId)
        .orderBy('time', descending: false)
        .snapshots();
  }
}
