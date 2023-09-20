import 'package:freezed_annotation/freezed_annotation.dart';

part 'dummy_data.freezed.dart';
part 'dummy_data.g.dart';

@freezed
abstract class DummyDataModel with _$DummyDataModel {
  const factory DummyDataModel({
    required String? status,
    required int? totalResults,
    required List<Article>? articles,
  }) = _DummyDataModel;

  factory DummyDataModel.fromJson(Map<String, dynamic> json) =>
      _$DummyDataModelFromJson(json);
}

@freezed
abstract class Article with _$Article {
  const factory Article({
    required Source? source,
    required String? author,
    required String? title,
    required String? description,
    required String? url,
    required String? urlToImage,
    required String? publishedAt,
    required String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
abstract class Source with _$Source {
  const factory Source({
    required String? id,
    required String? name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
