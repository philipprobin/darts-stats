import 'package:flutter/material.dart';
import '../services/ranking_service.dart';
import '../models/ranking_model.dart';
import '../widgets/ranking_card.dart';

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({super.key});

  @override
  _RankingsScreenState createState() => _RankingsScreenState();
}

class _RankingsScreenState extends State<RankingsScreen> {
  final RankingService _rankingService = RankingService();
  late Future<List<Ranking>> _rankingsFuture;

  @override
  void initState() {
    super.initState();
    _rankingsFuture = _rankingService.fetchRankings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Darts Rankings"),
      ),
      body: FutureBuilder<List<Ranking>>(
        future: _rankingsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No rankings available"));
          }

          final rankings = snapshot.data!;

          return ListView.builder(
            itemCount: rankings.length,
            itemBuilder: (context, index) {
              return RankingCard(ranking: rankings[index]);
            },
          );
        },
      ),
    );
  }
}
