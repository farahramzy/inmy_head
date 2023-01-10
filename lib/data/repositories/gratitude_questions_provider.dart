import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/model/gratitude_questions_model.dart';

Stream gratitudeQuestions = GratitudeQuestions().getGratitudeQuestions();
final gratitudeQuestionsProviderRepository =
    StateProvider<Stream>((ref) => gratitudeQuestions);

final gratitudeQuestionsProvider =
    StreamProvider(((ref) => ref.watch(gratitudeQuestionsProviderRepository)));
