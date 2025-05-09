import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nyt_flutter_app/models/article_model.dart';

class ApiService {
  final Dio _dio = Dio()
    ..interceptors.add(LogInterceptor(
        requestBody: true, request: true, requestHeader: true, responseBody: true, responseHeader: true));

  Future<List<ArticleModel>> fetchMostPopularArticles(String type) async {
    try {
      final apiKey = dotenv.env['NYT_API_KEY'];

      final url = 'https://api.nytimes.com/svc/mostpopular/v2/$type/1.json?api-key=$apiKey';

      final response = await _dio.get(url);

      if (response.statusCode == 200 && response.data['results'] != null) {
        log("RESPONSE:: ${json.encode(response.data['results'])}");
        return articleModelFromJson(json.encode(response.data['results']));
      } else {
        throw Exception('Invalid response from API');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        log('Connection timed out');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        log('Receive timeout');
      } else if (e.type == DioExceptionType.badResponse) {
        log('Server responded with error: ${e.response?.statusCode}');
      } else {
        log('Dio error: ${e.message}');
      }
      return [];
    } catch (e) {
      log('Unexpected error: $e');
      return [];
    }
  }

  Future<List<ArticleModel>> fetchArticlesByQuery(String query) async {
    try {
      final apiKey = dotenv.env['NYT_API_KEY'];
      final url = 'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=$query&api-key=$apiKey';

      final response = await _dio.get(url);
      final docs = response.data['response']['docs'] as List<dynamic>;
      log("RESPONSE:: ${json.encode(docs)}");
      return articleModelFromJson(json.encode(docs));
    } catch (e) {
      log('Search API error: $e');
      return [];
    }
  }
}
