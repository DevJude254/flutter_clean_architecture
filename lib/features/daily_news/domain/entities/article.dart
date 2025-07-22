import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int ? id;
  final String ? title;
  final String ? content;
  final String ? author;
  final String ? url;
  final String ? urlToImage;
  final String ? publishedAt;
  final String ? description;

  const ArticleEntity({
    this.id,
    this.title,
    this.content,
    this.author,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.description,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    content,
    author,
    url,
    urlToImage,
    publishedAt,
    description,
  ];
}