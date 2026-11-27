import 'package:flutter/material.dart';

class HomeStatusCard extends StatelessWidget {
  final int activeCount;
  final int totalCount;

  const HomeStatusCard({
    super.key,
    required this.activeCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalCount == 0 ? 0.0 : activeCount / totalCount;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Color(0xFF15383D), Color(0xFF152333)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Home Overview',
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(height: 8),
                Text(
                  '$activeCount / $totalCount',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5EEAD4),
                  ),
                ),
                const Text('Active Devices'),
              ],
            ),
          ),
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 6,
                    backgroundColor: Colors.white12,
                    color: const Color(0xFF5EEAD4),
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
