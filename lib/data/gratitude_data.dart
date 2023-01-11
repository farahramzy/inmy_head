import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inmy_head/data/user_data.dart';

class GratitudeData {
  Future addGratitude(String userId, List<String> gratitudeList) async {
    FirebaseFirestore.instance.collection('gratitude').add({
      'userid': userId,
      'ans': gratitudeList,
    });
  }

  Stream<QuerySnapshot> getGratitudeQuestions() {
    return FirebaseFirestore.instance
        .collection('Gratitude Question')
        .snapshots();
  }

  Stream<QuerySnapshot> getGratitudeUserData() {
    return FirebaseFirestore.instance
        .collection('gratitude')
        .where('userid', isEqualTo: userId)
        .snapshots();
  }
}
