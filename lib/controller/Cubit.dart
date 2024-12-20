import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_6/controller/State.dart';

class HomeCubit extends Cubit<NewsState> {
  HomeCubit() : super(Initalstate());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> authors = [];
  List<String> titles = [];
  List<String> publishedAt = [];
  List<String> urls = [];

  void getnews() async {
    emit(LoadingNews());
    try {
      final response = await Dio().get("https://newsapi.org/v2/top-headlines?country=eg&apiKey=c65a123de6b64b08a95eaf002cf6860c");
      if (response.data.toString().isEmpty) {
        emit(FailedNews());
      } else {
        final newsList = response.data["articles"];
        for (var article in newsList) {
          authors.add(article["author"].toString());
          titles.add(article["title"].toString());
          publishedAt.add(article["publishedAt"].toString());
          urls.add(article["url"].toString());
        }
        emit(SucessNews());
      }
    } catch (e) {
      emit(Apifailed(e.toString()));
    }
  }
}
