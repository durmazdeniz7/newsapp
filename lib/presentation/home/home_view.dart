import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/product/enum/lottie_enum.dart';
import 'package:newsapp/product/extension/project_extions.dart';
import 'package:newsapp/product/router/approuter.dart';

@RoutePage()
class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool isSearch = false;
  final NewsController controller = Get.put(NewsController()..getNews());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.white),
                    hintText: 'Search News',
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
                onSubmitted: (value) {
                  controller.searchQuery.value = value;
                  controller.searchNews();
                },
              )
            : Text(
                'News App',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearch = !isSearch;
                });
              },
              icon: Icon(isSearch ? Icons.close : Icons.search))
        ],
      ),
      body: GetX<NewsController>(
        builder: (controller) {
          if (controller.newsData.value == null) {
            return Center(
              child: LottieEnums.loading.toLottie(),
            );
          }

          if (controller.newsData.value?.news?.isEmpty ?? true) {
            return const Center(
              child: Text('No News Found'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.newsData.value?.news?.length ?? 0,
            itemBuilder: (context, index) {
              final news = controller.newsData.value?.news?[index];

              return GestureDetector(
                onTap: () {
                  context.router.push(NewsDetailRoute(news: news));
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: news?.image != null
                              ? Image.network(
                                  news?.image ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return LottieEnums.notloadimage.toLottie();
                                  },
                                )
                              : LottieEnums.notloadimage.toLottie(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                news?.title ?? '',
                                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                news?.description ?? '',
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    news?.author ?? '',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    news?.publishedAt.parseDate() ?? '',
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
