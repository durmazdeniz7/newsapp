import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:newsapp/core/network/network_manager.dart';
import 'package:newsapp/data/model/news/news.dart';

import '../../product/enum/service_enum.dart';

class NewsService {
  Future<NewsData?> getNews({String? keywords}) async {
    try {
      final response = await NetworkManager.instance.service
          .get(ServiceEnum.news.name, queryParameters: {'keywords': keywords, 'limit': 100});
      if (response.statusCode == HttpStatus.ok) {
        // log(response.data.toString());
        return NewsData.fromJson(response.data);
      }
    } on DioError catch (e) {
      log(e.message ?? '', name: 'NewsService/getNews');
      return NewsData(news: null);
    }
    return null;
  }
}
