import 'dart:io';

import 'package:curr_affairs/core/constants/constants.dart';
import 'package:curr_affairs/features/daily_news/data/models/article.dart';
import 'package:curr_affairs/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

import '../../../../core/resources/data_state.dart';
import '../data_sources/remote/news_api_service.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final HttpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (HttpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(HttpResponse.data);
      } else {
        return DataFailed(
          DioException(
            requestOptions: HttpResponse.response.requestOptions,
            response: HttpResponse.response,
            type: DioExceptionType.badResponse,
            error: HttpResponse.response.statusMessage ?? 'Unknown error',
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
