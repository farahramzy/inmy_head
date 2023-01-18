import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../blog_data.dart';

Future blog = BlogData().getBlog();
final blogProviderRepository = StateProvider<Future>((ref) => blog);

final blogProvider = FutureProvider((ref) async {
  return ref.watch(blogProviderRepository);
});
