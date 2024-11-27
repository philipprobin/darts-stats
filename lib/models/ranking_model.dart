class Ranking {
  final int rank;
  final String name;
  final String abbreviation;
  final double prizeMoney;

  Ranking({
    required this.rank,
    required this.name,
    required this.abbreviation,
    required this.prizeMoney,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      rank: json['rank'] ?? 0,
      name: json['competitor']['name'] ?? 'Unknown',
      abbreviation: json['competitor']['abbreviation'] ?? '',
      prizeMoney: (json['prize_money'] ?? 0).toDouble(),
    );
  }
}
