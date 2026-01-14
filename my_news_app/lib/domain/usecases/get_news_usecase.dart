import '../entities/news_entity.dart';
import '../repositories/news_repository.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase({required this.repository});

  Future<List<NewsEntity>> call() async {
    return await repository.getNews();
  }
}
