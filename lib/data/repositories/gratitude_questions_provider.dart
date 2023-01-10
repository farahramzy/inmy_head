import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/model/gratitude_questions_model.dart';

Stream gratitudeQuestions = GratitudeQuestions().getGratitudeQuestions();
final gratitudeQuestionsProviderRepository =
    StateProvider<Stream>((ref) => gratitudeQuestions);

final gratitudeQuestionsProvider =
    StreamProvider(((ref) => ref.watch(gratitudeQuestionsProviderRepository)));

//////////GET USER GRATITUDE DATA//////////
Stream gratitudeData = GratitudeQuestions().getGratitudeUserData();
final gratitudeDataProviderRepository =
    StateProvider<Stream>((ref) => gratitudeData);

final gratitudeDataProvider =
    StreamProvider(((ref) => ref.watch(gratitudeDataProviderRepository)));
