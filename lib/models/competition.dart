// lib/models/competition.dart

class Competition {
  final String id;
  final String name;
  final String gender;
  final String categoryName;

  Competition({
    required this.id,
    required this.name,
    required this.gender,
    required this.categoryName,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown',
      gender: json['gender'] ?? 'unknown',
      categoryName: json['category']['name'] ?? 'Unknown',
    );
  }
}
