import 'package:get/get.dart';
import '../../../domain/entities/news_entity.dart';
import '../../../domain/usecases/get_news_usecase.dart';

class NewsController extends GetxController {
  final GetNewsUseCase getNewsUseCase;

  NewsController({required this.getNewsUseCase});

  // Observable state
  var isLoading = false.obs;
  var newsList = <NewsEntity>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final news = await getNewsUseCase.call();
      newsList.value = news;
      
    } catch (e) {
      errorMessage.value = 'Failed to load news: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  void refreshNews() {
    fetchNews();
  }
}
