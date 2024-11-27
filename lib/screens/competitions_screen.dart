// lib/screens/competitions_screen.dart

import 'package:flutter/material.dart';
import '../services/competition_service.dart';
import '../models/competition.dart';

class CompetitionsScreen extends StatefulWidget {
  const CompetitionsScreen({super.key});

  @override
  _CompetitionsScreenState createState() => _CompetitionsScreenState();
}

class _CompetitionsScreenState extends State<CompetitionsScreen> {
  final CompetitionService _competitionService = CompetitionService();
  late Future<List<Competition>> _competitionsFuture;

  @override
  void initState() {
    super.initState();
    _competitionsFuture = _competitionService.fetchCompetitions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Competitions'),
      ),
      body: FutureBuilder<List<Competition>>(
        future: _competitionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No competitions available.'));
          } else {
            final competitions = snapshot.data!;
            return ListView.builder(
              itemCount: competitions.length,
              itemBuilder: (context, index) {
                final competition = competitions[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(competition.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category: ${competition.categoryName}'),
                        Text('Gender: ${competition.gender}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
