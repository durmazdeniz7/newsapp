import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(createToJson: false)
class NewsData {
  @JsonKey(name: 'data')
  List<News>? news;
  Pagination? pagination;

  NewsData({this.news, this.pagination});

  factory NewsData.fromJson(Map<String, dynamic> json) => _$NewsDataFromJson(json);
}

@JsonSerializable(createToJson: false)
class Pagination {
  final int? limit;
  final int? offset;
  final int? count;
  final int? total;
  Pagination({this.limit, this.offset, this.count, this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}

@JsonSerializable(createToJson: false)
class News {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? source;
  final String? image;
  final String? category;
  final String? language;
  final String? country;
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.source,
      this.image,
      this.category,
      this.language,
      this.country,
      this.publishedAt});
  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
