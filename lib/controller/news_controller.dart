import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/data/model/news/news.dart';
import 'package:newsapp/data/service/news_service.dart';

class NewsController extends GetxController {
  final NewsService _newsService = NewsService();


  final newsData = Rx<NewsData?>(null);
  var searchQuery = ''.obs; // Kullanıcının yaptığı arama sorgusunu tutan değişken

 
  void searchNews() async {
    if (searchQuery.value.isNotEmpty) {
      final result = await _newsService.getNews(query: searchQuery.value);
      newsData.value = result;
    } else {
      getNews();
    }
  }

  Future<void> getNews({String? query}) async {
    try {
      final response = await _newsService.getNews(query: query);
      if (response != null && response.news != null) {
        newsData.value = response;
      }
    } catch (e) {
      debugPrint('Error while fetching news: $e');
    }
  }
}
