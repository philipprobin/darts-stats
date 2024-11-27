// lib/services/base_api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseApiService {
  final String baseUrl;
  final Map<String, String> headers;

  BaseApiService({required this.baseUrl, this.headers = const {}});

  Future<dynamic> get(String endpoint) async {
    final url = "$baseUrl$endpoint";

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            "Request failed: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("Error during API request: $e");
    }
  }
}
