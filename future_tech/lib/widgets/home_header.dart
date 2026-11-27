import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final date = '${now.day}/${now.month}/${now.year}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.home_rounded, color: Color(0xFF5EEAD4), size: 40),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FutureTech',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'SMART HOME SYSTEM',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.wifi, color: Color(0xFF5EEAD4)),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(color: Colors.white12),
        const SizedBox(height: 16),
        Text(date, style: const TextStyle(color: Colors.white54)),
        const SizedBox(height: 8),
        const Text(
          'Welcome Home!',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Your home. Your control.',
          style: TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ],
    );
  }
}
