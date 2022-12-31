import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inmy_head/model/user_model.dart';

class MoodTrackers {
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
