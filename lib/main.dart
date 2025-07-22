import 'package:curr_affairs/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:curr_affairs/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:curr_affairs/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart';

void main() async {
  await initialiseDependancies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl<RemoteArticleBloc>()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        home: const Home(),
      ),
    );
  }
}
