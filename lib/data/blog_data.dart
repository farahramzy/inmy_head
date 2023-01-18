import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:math';

class BlogData {
  Future<Object> getBlog() {
    var list1 = ['blog', 'blog1'];
    var randomBlog = list1[Random().nextInt(list1.length)];

    // print(randomBlog);
    return FirebaseFirestore.instance.collection('blog').doc(randomBlog).get();
  }
}
