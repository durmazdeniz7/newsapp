// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'approuter.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    NewsRoute.name: (routeData) {
      final args =
          routeData.argsAs<NewsRouteArgs>(orElse: () => const NewsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsView(key: args.key),
      );
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>(
          orElse: () => const NewsDetailRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NewsDetailView(
          key: args.key,
          news: args.news,
        ),
      );
    },
  };
}

/// generated route for
/// [NewsView]
class NewsRoute extends PageRouteInfo<NewsRouteArgs> {
  NewsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          NewsRoute.name,
          args: NewsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const PageInfo<NewsRouteArgs> page = PageInfo<NewsRouteArgs>(name);
}

class NewsRouteArgs {
  const NewsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NewsDetailView]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    Key? key,
    News? news,
    List<PageRouteInfo>? children,
  }) : super(
          NewsDetailRoute.name,
          args: NewsDetailRouteArgs(
            key: key,
            news: news,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsDetailRoute';

  static const PageInfo<NewsDetailRouteArgs> page =
      PageInfo<NewsDetailRouteArgs>(name);
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    this.news,
  });

  final Key? key;

  final News? news;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, news: $news}';
  }
}
