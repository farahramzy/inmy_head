import 'package:cloud_firestore/cloud_firestore.dart';

class AddWorry {
  Future addWorry(String userId, List<String> worryList) async {
    FirebaseFirestore.instance.collection('worry').add({
      'userid': userId,
      'ans': worryList,
    });
  }
}
