import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../worry_data.dart';

Stream worryQuestions = WorryData().getWorryQuestions();
final worryQuestionsProviderRepository =
    StateProvider<Stream>((ref) => worryQuestions);

final worryQuestionsProvider =
    StreamProvider(((ref) => ref.watch(worryQuestionsProviderRepository)));

//////////GET USER WORRY DATA//////////
Stream worryData = WorryData().getWorryUserData();
final worryDataProviderRepository = StateProvider<Stream>((ref) => worryData);

final worryDataProvider =
    StreamProvider(((ref) => ref.watch(worryDataProviderRepository)));
