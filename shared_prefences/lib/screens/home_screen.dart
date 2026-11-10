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
  List<DreamDestination> savedDestinations = [];

  final preferencesService = PreferencesService();

  Future<void> saveDestination(DreamDestination dream) async {
    setState(() {
      savedDestinations.add(dream);
    });

    await preferencesService.setDestinations(savedDestinations);
  }

  Future<void> loadDestinations() async {
    final destinations = await preferencesService.getDestinations();

    setState(() {
      savedDestinations = destinations;
    });
  }

  @override
  void initState() {
    super.initState();
    loadDestinations();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      AddDestinationScreen(onSave: saveDestination),
      VisitedPlacesScreen(destinations: savedDestinations),
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
