part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetNews extends NewsEvent {
  final String? query;
  GetNews({this.query});
}
