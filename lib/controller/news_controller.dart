import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/data/model/news/news.dart';
import 'package:newsapp/data/service/news_service.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();
  final newsData = Rx<NewsData?>(null);
  RxBool isLoading = true.obs;

  Future<void> getNews({String? query}) async {
    try {
      final response = await _newsService.getNews();
      if (response != null && response.news != null) {
        newsData.value = response;
        isLoading = false.obs;
      }
    } catch (e) {
      debugPrint('Error while fetching news: $e');
    }
  }
}
