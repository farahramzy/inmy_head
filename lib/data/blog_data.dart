// import 'package:cloud_firestore/cloud_firestore.dart';

// class BlogData {
//   Stream<QuerySnapshot> getBlog() {
//     return FirebaseFirestore.instance.collection('blog').snapshots();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class BlogData {
  Stream<QuerySnapshot> getBlog() {
    return FirebaseFirestore.instance.collection('blog').snapshots();
  }
}
