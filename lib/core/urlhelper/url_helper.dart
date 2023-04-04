import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

mixin UrlLauncherHelper {
  Future<void> goPage(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url),
          mode: Platform.isAndroid ? LaunchMode.externalApplication : LaunchMode.platformDefault);
    } else {
      throw 'Şu an Url açılmadı $url';
    }
  }
}
