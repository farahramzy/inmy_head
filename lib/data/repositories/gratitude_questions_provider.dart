import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/reflection_questions_model.dart';

Stream gratitudeQuestions = ReflectionQuestions().getReflectionQuestions();
final gratitudeQuestionsProviderRepository =
    StateProvider<Stream>((ref) => gratitudeQuestions);

final gratitudeQuestionsProvider =
    StreamProvider(((ref) => ref.watch(gratitudeQuestionsProviderRepository)));
