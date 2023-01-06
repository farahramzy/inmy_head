import 'package:cloud_firestore/cloud_firestore.dart';

class AddGratitude {
  Future addGratitude(String userId, List<String> gratitudeList) async {
    FirebaseFirestore.instance.collection('gratitude').add({
      'userid': userId,
      'ans': gratitudeList,
    });
  }
}
