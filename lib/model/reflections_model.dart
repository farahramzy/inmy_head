import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inmy_head/model/user_model.dart';

class ReflectionModel {
  String? question;

  ReflectionModel({this.question});

  ReflectionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    return data;
  }

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
