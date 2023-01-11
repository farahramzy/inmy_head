import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../reflection_data.dart';

Stream reflectionQuestions = Reflectionata().getReflectionQuestions();
final reflectionQuestionsProviderRepository =
    StateProvider<Stream>((ref) => reflectionQuestions);

final reflectionQuestionsProvider =
    StreamProvider(((ref) => ref.watch(reflectionQuestionsProviderRepository)));

//////////GET USER REFLECTION DATA//////////
Stream reflectionData = Reflectionata().getReflectionUserData();
final reflectionDataProviderRepository =
    StateProvider<Stream>((ref) => reflectionData);

final reflectionDataProvider =
    StreamProvider(((ref) => ref.watch(reflectionDataProviderRepository)));
