import '../../domain/entities/news_entity.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_datasource.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<NewsEntity>> getNews() async {
    try {
      final newsModels = await remoteDataSource.getNews();
      return newsModels;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
