import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inmy_head/data/user_data.dart';

class Reflectionata {
  Future addReflection(String userId, List<String> reflectionList) async {
    FirebaseFirestore.instance.collection('reflection').add({
      'userid': userId,
      'ans': reflectionList,
    });
  }

  Stream<QuerySnapshot> getReflectionUserData() {
    return FirebaseFirestore.instance
        .collection('reflection')
        .where('userid', isEqualTo: userId)
        .snapshots();
  }

  Stream<QuerySnapshot> getReflectionQuestions() {
    return FirebaseFirestore.instance
        .collection('Reflection Question')
        .snapshots();
  }
}
