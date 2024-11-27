// lib/widgets/bottom_navigation.dart

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.leaderboard), // Rankings Icon
          label: 'Rankings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event), // Competitions Icon
          label: 'Competitions',
        ),
      ],
    );
  }
}
