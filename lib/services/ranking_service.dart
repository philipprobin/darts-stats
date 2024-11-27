// lib/services/ranking_service.dart

import 'package:dartsstats/services/base_api_service.dart';

import '../models/ranking_model.dart';
import '../utils/api_config.dart';

class RankingService {
  final BaseApiService _apiService =
  BaseApiService(baseUrl: rankingsBaseUrl, headers: defaultHeaders);

  Future<List<Ranking>> fetchRankings() async {
    try {
      final data = await _apiService.get("?api_key=$apiKey");
      final competitorRankings = data['rankings'][0]['competitor_rankings'] as List;

      return competitorRankings
          .map((ranking) => Ranking.fromJson(ranking))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch rankings: $e");
    }
  }
}
