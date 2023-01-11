import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inmy_head/data/user_data.dart';

class WorryData {
  Future addWorry(String userId, List<String> worryList) async {
    FirebaseFirestore.instance.collection('worry').add({
      'userid': userId,
      'ans': worryList,
    });
  }

  Stream<QuerySnapshot> getWorryQuestions() {
    return FirebaseFirestore.instance.collection('Worry Question').snapshots();
  }

  Stream<QuerySnapshot> getWorryUserData() {
    return FirebaseFirestore.instance
        .collection('worry')
        .where('userid', isEqualTo: userId)
        .snapshots();
  }
}
