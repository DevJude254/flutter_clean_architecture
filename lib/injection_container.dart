import 'package:curr_affairs/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:curr_affairs/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:curr_affairs/features/daily_news/domain/repository/article_repository.dart';
import 'package:curr_affairs/features/daily_news/domain/usecases/get_article.dart';
import 'package:curr_affairs/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initialiseDependancies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependancies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<GetArticleUsecase>(GetArticleUsecase(sl()));

  // BLoCs
  sl.registerFactory(() => RemoteArticleBloc(sl()));
}
