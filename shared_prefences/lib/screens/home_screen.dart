import 'package:flutter/material.dart';
import 'package:shared_prefences/models/dream_destination.dart';
import 'package:shared_prefences/services/prefences_service.dart';

import 'add_destination_screen.dart';
import 'visited_places_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  DreamDestination? savedDestination;

  final preferencesService = PreferencesService();

  Future<void> saveDestination(DreamDestination dream) async {
    await preferencesService.setDestination(dream);

    setState(() {
      savedDestination = dream;
    });
  }

  Future<void> loadDestination() async {
    final destination = await preferencesService.getDestination();

    setState(() {
      savedDestination = destination;
    });
  }

  @override
  void initState() {
    super.initState();
    loadDestination();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      AddDestinationScreen(onSave: saveDestination),
      VisitedPlacesScreen(destination: savedDestination),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Dream Destinations')),

      body: pages[currentPageIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.add_location_alt),
            label: 'Add Destination',
          ),
          NavigationDestination(icon: Icon(Icons.map), label: 'Visited Places'),
        ],
      ),
    );
  }
}
