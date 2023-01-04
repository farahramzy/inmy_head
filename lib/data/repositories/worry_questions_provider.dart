import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inmy_head/model/worry_questions_model.dart';

Stream worryQuestions = WorryQuestions().getWorryQuestions();
final worryQuestionsProviderRepository =
    StateProvider<Stream>((ref) => worryQuestions);

final worryQuestionsProvider =
    StreamProvider(((ref) => ref.watch(worryQuestionsProviderRepository)));
