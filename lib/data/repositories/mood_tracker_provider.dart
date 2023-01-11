import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../mood_tracker_data.dart';

Stream moodTrackerData = MoodTrackerData().getMoodTracker();
final moodTrackerProviderRepository =
    StateProvider<Stream>((ref) => moodTrackerData);

final moodTrackerProvider =
    StreamProvider(((ref) => ref.watch(moodTrackerProviderRepository)));
