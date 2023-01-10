import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inmy_head/model/user_model.dart';

class WorryQuestions {
  String? question;

  WorryQuestions({this.question});

  WorryQuestions.fromJson(Map<String, dynamic> json) {
    question = json['question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    return data;
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
