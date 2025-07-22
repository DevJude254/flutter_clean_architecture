import 'package:curr_affairs/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/data_state.dart';
import 'remote_article_event.dart';
import 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {

  final GetArticleUsecase _getArticleUsecase;
  RemoteArticleBloc(this._getArticleUsecase) : super(const RemoteArticleInitial()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleSuccess(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(RemoteArticleFailed(dataState.error!));
    } 
  }
}
