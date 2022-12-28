import 'package:cloud_firestore/cloud_firestore.dart';

class MoodTrackers {
  // String moodText;
  // String firstName = '';

  // MoodTrackers({required this.moodText, required this.firstName});

  Future addMoodTracker(String userId, String moodText, var time) async {
    await FirebaseFirestore.instance.collection('Mood Tracker').add({
      'id': userId,
      'Mood Text': moodText,
      'time': time,
    });
  }
}
