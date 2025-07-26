import 'package:curr_affairs/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:curr_affairs/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:curr_affairs/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _buildBody(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Daily News'),
      centerTitle: true,
      backgroundColor: Colors.grey[100],
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RemoteArticleSuccess) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              final article = state.articles![index];
              return ListTile(
                title: Text('$index'),
                subtitle: Text(article.description ?? 'No description available'),
              );
            },
          );
        } else if (state is RemoteArticleFailed) {
          return Center(
            child: IconButton(
              icon: Icon(Icons.refresh, size: 40, color: Colors.blue),
              onPressed: () {
                context.read<RemoteArticleBloc>().add(GetArticles());
              },
            ),
          );
        }
        return const SizedBox.shrink();
      }
    );
  }
}