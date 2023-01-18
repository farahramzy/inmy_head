// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class BlogData {
// //   Stream<QuerySnapshot> getBlog() {
// //     return FirebaseFirestore.instance.collection('blog').snapshots();
// //   }
// // }

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

// // final random = Random();
// // var randomBlog = list1[Random.nextInt(list1.length)];

// class BlogData {
//   // Future<Object> getBlog() {
//   Future<DocumentSnapshot> getBlog(randomBlog) {
//     // var list1 = ['blog', 'blog1'];
//     // var randomBlog = list1[Random().nextInt(list1.length)];

//     print(randomBlog);
//     // return FirebaseFirestore.instance.collection('blog').doc(randomBlog).get();
//     return FirebaseFirestore.instance.collection('blog').doc(randomBlog).get();
//   }
// }

class BlogData {
  Future<Object> getBlog() {
    var list1 = ['blog', 'blog1'];
    var randomBlog = list1[Random().nextInt(list1.length)];

    print(randomBlog);
    return FirebaseFirestore.instance.collection('blog').doc(randomBlog).get();
  }
}
