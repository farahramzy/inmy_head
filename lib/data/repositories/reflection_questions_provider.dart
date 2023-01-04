import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/reflection_questions_model.dart';

Stream reflectionQuestions = ReflectionQuestions().getReflectionQuestions();
final reflectionQuestionsProviderRepository =
    StateProvider<Stream>((ref) => reflectionQuestions);

final reflectionQuestionsProvider =
    StreamProvider(((ref) => ref.watch(reflectionQuestionsProviderRepository)));
