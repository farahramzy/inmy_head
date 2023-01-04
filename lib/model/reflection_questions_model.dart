import 'package:cloud_firestore/cloud_firestore.dart';

class ReflectionQuestions {
  String? question;

  ReflectionQuestions({this.question});

  ReflectionQuestions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    return data;
  }

  Stream<QuerySnapshot> getReflectionQuestions() {
    return FirebaseFirestore.instance
        .collection('Reflection Question')
        .snapshots();
  }
}
