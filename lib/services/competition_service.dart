// lib/services/competition_service.dart

import 'package:dartsstats/services/base_api_service.dart';

import '../models/competition.dart';
import '../utils/api_config.dart';

class CompetitionService {
  final BaseApiService _apiService =
  BaseApiService(baseUrl: competitionsBaseUrl, headers: defaultHeaders);

  Future<List<Competition>> fetchCompetitions() async {
    try {
      final data = await _apiService.get("?api_key=$apiKey");
      final competitions = data['competitions'] as List;

      return competitions
          .map((competition) => Competition.fromJson(competition))
          .toList();
    } catch (e) {
      throw Exception("Failed to fetch competitions: $e");
    }
  }
}
