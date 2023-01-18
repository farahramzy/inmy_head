import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../blog_data.dart';

final blogProviderRepository =
    StateProvider<Stream<QuerySnapshot>>((ref) => BlogData().getBlog());
final blogProvider =
    StreamProvider<QuerySnapshot>((ref) => ref.watch(blogProviderRepository));
