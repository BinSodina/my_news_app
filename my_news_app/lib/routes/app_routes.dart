import 'package:get/get.dart';
import '../presentation/bindings/news_binding.dart';
import '../presentation/views/news/news_view.dart';

class AppRoutes {
  static const String news = '/news';
  
  static final routes = [
    GetPage(
      name: news,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
  ];
}
