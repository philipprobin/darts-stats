import 'package:flutter/material.dart';
import '../models/ranking_model.dart';

class RankingCard extends StatelessWidget {
  final Ranking ranking;

  const RankingCard({super.key, required this.ranking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${ranking.rank}'),
        ),
        title: Text(ranking.name),
        subtitle: Text(
            'Abbreviation: ${ranking.abbreviation}\nPrize Money: \$${ranking.prizeMoney.toStringAsFixed(2)}'),
      ),
    );
  }
}
