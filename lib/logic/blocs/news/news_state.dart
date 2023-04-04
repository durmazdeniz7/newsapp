part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class LoadingNews extends NewsState {}

class LoadedNews extends NewsState {
  final NewsData newsData;
  LoadedNews({required this.newsData});
}

class ErrorNews extends NewsState {
  final String message;
  ErrorNews({required this.message});
}
