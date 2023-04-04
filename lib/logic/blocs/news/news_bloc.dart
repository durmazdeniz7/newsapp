import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:newsapp/data/model/news/news.dart';
import 'package:newsapp/data/service/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService _newsService = NewsService();
  NewsBloc() : super(NewsInitial()) {
    on<GetNews>((event, emit) async {
      emit(LoadingNews());
      final response = await _newsService.getNews(keywords: event.query);
      if (response != null) {
        if (response.news != null) {
          emit(LoadedNews(newsData: response));
        }
      }
    });
  }
}
