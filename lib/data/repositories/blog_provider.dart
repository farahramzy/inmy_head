// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import '../blog_data.dart';

// // //The blog_provider.dart file is using the flutter_riverpod package, which is a state management library for Flutter apps.

// // Stream blogQuestions = BlogData().getBlog();
// // final blogQuestionsProviderRepository =
// //     StateProvider<Stream>((ref) => blogQuestions);

// // final blogProvider =
// //     StreamProvider(((ref) => ref.watch(blogQuestionsProviderRepository)));

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../blog_data.dart';

// // Future blog = BlogData().getBlog();
// Future<DocumentSnapshot> blog = BlogData().getBlog(randomBlog);

// final blogProviderRepository = StateProvider<Future>((ref) => blog);

// final blogProvider = FutureProvider((ref) async {
//   return ref.watch(blogProviderRepository);
// });

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../blog_data.dart';

Future blog = BlogData().getBlog();
final blogProviderRepository = StateProvider<Future>((ref) => blog);

final blogProvider = FutureProvider((ref) async {
  return ref.watch(blogProviderRepository);
});
