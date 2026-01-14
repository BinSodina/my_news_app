import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../data/datasources/news_remote_datasource.dart';
import '../../../data/repositories/news_repository_impl.dart';
import '../../../domain/usecases/get_news_usecase.dart';
import '../../../presentation/controllers/news/news_controller.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    // Data sources
    Get.lazyPut<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(client: http.Client()),
    );

    // Repositories
    Get.lazyPut<NewsRepositoryImpl>(
      () => NewsRepositoryImpl(remoteDataSource: Get.find()),
    );

    // Use cases
    Get.lazyPut<GetNewsUseCase>(
      () => GetNewsUseCase(repository: Get.find<NewsRepositoryImpl>()),
    );

    // Controllers
    Get.lazyPut<NewsController>(
      () => NewsController(getNewsUseCase: Get.find()),
    );
  }
}
