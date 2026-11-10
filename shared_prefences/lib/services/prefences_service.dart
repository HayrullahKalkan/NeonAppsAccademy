import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import '../models/dream_destination.dart';

class PreferencesService {
  Future<void> setDestinations(List<DreamDestination> destinations) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = destinations.map((destination) {
      return {
        'hasVisited': destination.hasVisited,
        'visitCount': destination.visitCount,
        'destination': destination.destination,
      };
    }).toList();

    await prefs.setString('destinations', jsonEncode(jsonList));
  }

  Future<List<DreamDestination>> getDestinations() async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString('destinations');

    if (jsonString == null) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonString);

    return jsonList.map((item) {
      return DreamDestination(
        hasVisited: item['hasVisited'],
        visitCount: item['visitCount'],
        destination: item['destination'],
      );
    }).toList();
  }
}
