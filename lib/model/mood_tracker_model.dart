import 'package:cloud_firestore/cloud_firestore.dart';

class MoodTrackers {
  Future addMoodTracker(String userId, String moodText, var time) async {
    await FirebaseFirestore.instance.collection('Mood Tracker').add({
      'id': userId,
      'Mood Text': moodText,
      'time': time,
    });
  }
}
