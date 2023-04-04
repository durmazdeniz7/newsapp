import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newsapp/core/network/network_manager.dart';
import 'package:newsapp/data/model/news/news.dart';

import '../../product/enum/service_enum.dart';

class NewsService {
  Future<NewsData?> getNews({String? query}) async {
    try {
      final response = await NetworkManager.instance.service
          .get(ServiceEnum.news.name, queryParameters: {'limit': 100, 'keywords': query});
      if (response.statusCode == HttpStatus.ok) {
        return NewsData.fromJson(response.data);
      }
    } on DioError catch (e) {
      log(e.message ?? '', name: 'NewsService/getNews');
      return NewsData(news: null);
    }
    return null;
  }
}
