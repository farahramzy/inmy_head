import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/reflections_model.dart';

Stream reflectionQuestions = ReflectionModel().getReflectionQuestions();
final reflectionQuestionsProviderRepository =
    StateProvider<Stream>((ref) => reflectionQuestions);

final reflectionQuestionsProvider =
    StreamProvider(((ref) => ref.watch(reflectionQuestionsProviderRepository)));

//////////GET USER REFLECTION DATA//////////
Stream reflectionData = ReflectionModel().getReflectionUserData();
final reflectionDataProviderRepository =
    StateProvider<Stream>((ref) => reflectionData);

final reflectionDataProvider =
    StreamProvider(((ref) => ref.watch(reflectionDataProviderRepository)));
