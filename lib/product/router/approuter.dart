import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/model/news/news.dart';
import 'package:newsapp/presentation/home/home_view.dart';
import 'package:newsapp/presentation/home/news_detail_view.dart';

part 'approuter.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: NewsRoute.page, path: '/', maintainState: true),
    AutoRoute(page: NewsDetailRoute.page, path: '/detail'),
  ];
}
