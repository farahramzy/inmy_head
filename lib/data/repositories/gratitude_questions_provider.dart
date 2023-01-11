import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gratitude_data.dart';

Stream gratitudeQuestions = GratitudeData().getGratitudeQuestions();
final gratitudeQuestionsProviderRepository =
    StateProvider<Stream>((ref) => gratitudeQuestions);

final gratitudeQuestionsProvider =
    StreamProvider(((ref) => ref.watch(gratitudeQuestionsProviderRepository)));

//////////GET USER GRATITUDE DATA//////////
Stream gratitudeData = GratitudeData().getGratitudeUserData();
final gratitudeDataProviderRepository =
    StateProvider<Stream>((ref) => gratitudeData);

final gratitudeDataProvider =
    StreamProvider(((ref) => ref.watch(gratitudeDataProviderRepository)));
