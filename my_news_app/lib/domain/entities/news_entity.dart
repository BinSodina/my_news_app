class NewsEntity {
  final String id;
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  final String imageUrl;

  NewsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.publishedAt,
    required this.imageUrl,
  });
}
