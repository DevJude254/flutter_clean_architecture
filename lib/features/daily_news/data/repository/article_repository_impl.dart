import 'package:curr_affairs/features/daily_news/data/models/article.dart';
import 'package:curr_affairs/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/resources/data_state.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}