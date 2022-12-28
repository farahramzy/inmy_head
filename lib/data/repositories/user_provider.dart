import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/model/user_model.dart';

Future userData = UserData().getUserDetails();
final userDataProviderRepository = StateProvider<Future>((ref) => userData);

final userDataProvider = FutureProvider(
  (ref) async {
    return ref.watch(userDataProviderRepository);
  },
);
