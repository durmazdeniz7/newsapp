import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/urlhelper/url_helper.dart';
import 'package:newsapp/data/model/news/news.dart';
import 'package:newsapp/product/enum/lottie_enum.dart';
import 'package:newsapp/product/extension/project_extions.dart';

@RoutePage()
class NewsDetailView extends StatelessWidget with UrlLauncherHelper {
  const NewsDetailView({Key? key, this.news}) : super(key: key);
  final News? news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Detail',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (news?.image != null)
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    news!.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return LottieEnums.notloadimage.toLottie();
                    },
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                news?.title ?? '',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      news?.publishedAt?.parseDate() ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 24),
                    const Icon(
                      Icons.category_rounded,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      news?.category ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    if (news?.author != null) const SizedBox(width: 24),
                    if (news?.author != null)
                      const Icon(
                        Icons.person_rounded,
                        size: 20,
                        color: Colors.grey,
                      ),
                    if (news?.author != null) const SizedBox(width: 8),
                    if (news?.author != null)
                      Text(
                        news!.author!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                news?.description ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  goPage(news!.url!);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Read More',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
