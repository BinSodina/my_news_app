import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/app_constants.dart';
import '../models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final http.Client client;

  NewsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<NewsModel>> getNews() async {
    try {
      // Build the API URL
      final url = Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.latestNewsEndpoint}?apikey=${AppConstants.apiKey}&language=en',
      );

      // Make the API call
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        
        // newsdata.io returns data in 'results' array
        if (jsonData['results'] != null && jsonData['results'] is List) {
          final List<dynamic> results = jsonData['results'];
          return results
              .map((json) => NewsModel.fromJson(json as Map<String, dynamic>))
              .toList();
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
