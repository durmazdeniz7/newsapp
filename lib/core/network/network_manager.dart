import 'package:dio/dio.dart';

class NetworkManager {
  NetworkManager._() {
    _dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
        queryParameters: {_key: _accessValue},
        sendTimeout: _duration,
        receiveTimeout: _duration,
        connectTimeout: _duration));
  }

  static NetworkManager instance = NetworkManager._();

  late final Dio _dio;
  final String _key = 'access_key';
  final String _accessValue = 'c4a2350521eca01601c65b68a5abab78';
  final String _baseUrl = 'http://api.mediastack.com/v1/';
  final Duration _duration = const Duration(seconds: 15);
  Dio get service => _dio;
}
