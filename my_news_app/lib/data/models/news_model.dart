import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  NewsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.author,
    required super.publishedAt,
    required super.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    // Handle creator array from newsdata.io API
    String author = 'Unknown';
    if (json['creator'] != null && json['creator'] is List && (json['creator'] as List).isNotEmpty) {
      author = (json['creator'] as List).first.toString();
    } else if (json['source_name'] != null) {
      author = json['source_name'].toString();
    }

    return NewsModel(
      id: json['article_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? 'No description available',
      author: author,
      publishedAt: json['pubDate'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'article_id': id,
      'title': title,
      'description': description,
      'creator': [author],
      'pubDate': publishedAt,
      'image_url': imageUrl,
    };
  }
}
