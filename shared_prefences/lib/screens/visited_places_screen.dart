import 'package:flutter/material.dart';

import '../models/dream_destination.dart';

class VisitedPlacesScreen extends StatelessWidget {
  final List<DreamDestination> destinations;

  const VisitedPlacesScreen({super.key, required this.destinations});

  @override
  Widget build(BuildContext context) {
    final visitedPlaces = destinations
        .where((destination) => destination.hasVisited)
        .toList();

    if (visitedPlaces.isEmpty) {
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

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: visitedPlaces.length,
      itemBuilder: (context, index) {
        final destination = visitedPlaces[index];

        return Card(
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.location_on)),
            title: Text(destination.destination),
            subtitle: Text('Visited ${destination.visitCount} times'),
            trailing: const Icon(Icons.check_circle, color: Colors.green),
          ),
        );
      },
    );
  }
}
