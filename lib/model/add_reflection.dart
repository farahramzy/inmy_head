import 'package:cloud_firestore/cloud_firestore.dart';

class AddReflection {
  Future addReflection(String userId, List<String> reflectionList) async {
    FirebaseFirestore.instance.collection('reflection').add({
      'userid': userId,
      'ans': reflectionList,
    });
  }
}
