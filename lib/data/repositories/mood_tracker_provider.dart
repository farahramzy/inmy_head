import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/mood_tracker_model.dart';

// Future moodTrackerData = MoodTrackers().getMoodTracker();
// final moodTrackerProviderRepository =
//     StateProvider<Future>((ref) => moodTrackerData);

// final moodTrackerProvider =
//     FutureProvider(((ref) => ref.watch(moodTrackerProviderRepository)));

Stream moodTrackerData = MoodTrackers().getMoodTracker();
final moodTrackerProviderRepository =
    StateProvider<Stream>((ref) => moodTrackerData);

final moodTrackerProvider =
    StreamProvider(((ref) => ref.watch(moodTrackerProviderRepository)));
 

// Stream moodTrackerData = MoodTrackers().getMoodTracker();
// final moodTrackerProviderRepository = StateProvider.autoDispose<Stream>((ref) {
//   ref.onDispose(() {
//     ref.controller.dispose();
//   });
//   return moodTrackerData;
// });

// final moodTrackerProvider = StreamProvider.autoDispose(
//     ((ref) => ref.watch(moodTrackerProviderRepository)));


//agarab el controller =null