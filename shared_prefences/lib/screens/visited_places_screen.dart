import 'package:flutter/material.dart';

import '../models/dream_destination.dart';

class VisitedPlacesScreen extends StatelessWidget {
  final DreamDestination? destination;

  const VisitedPlacesScreen({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    if (destination == null || !destination!.hasVisited) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.travel_explore, size: 70, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'You have not visited any places yet!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.location_on)),
            title: Text(destination!.destination),
            subtitle: Text('Visited ${destination!.visitCount} times'),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
          ),
        ),
      ],
    );
  }
}
