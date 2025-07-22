
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles!, error!];
}

class RemoteArticleInitial extends RemoteArticleState {
  const RemoteArticleInitial() : super();
}

class RemoteArticleSuccess extends RemoteArticleState {
  const RemoteArticleSuccess(List<ArticleEntity> articles)
      : super(articles: articles);

  @override
  List<Object?> get props => [articles];
}
class RemoteArticleFailed extends RemoteArticleState {
  const RemoteArticleFailed(DioException error) : super(error: error);

  @override
  List<Object?> get props => [error];
}