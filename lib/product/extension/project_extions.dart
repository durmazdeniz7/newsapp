import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/product/enum/lottie_enum.dart';

extension ConvertDateExtension on String? {
  String? parseDate() {
    if (this != null) {
      DateTime parseDate = DateFormat("yyyy-MM-ddThh:mm:ss").parse(this!);
      var inputDate = DateTime.parse(parseDate.toString());
      var outputFormat = DateFormat('dd.MM.yyyy');
      var outputDate = outputFormat.format(inputDate);
      return outputDate.toString();
    } else {
      return null;
    }
  }
}

extension LottieEnumsExtension on LottieEnums {
  String get path => 'assets/lotties/$name.json';
  Widget toLottie() {
    return Lottie.asset(path);
  }
}
