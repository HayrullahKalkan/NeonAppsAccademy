import 'package:shared_preferences/shared_preferences.dart';

import '../models/dream_destination.dart';

class PreferencesService {
  Future<void> setDestination(DreamDestination dream) async {
    final set = await SharedPreferences.getInstance();

    await set.setBool("hasVisited", dream.hasVisited);
    await set.setInt("visitCount", dream.visitCount);
    await set.setString("destination", dream.destination);
  }

  Future<DreamDestination> getDestination() async {
    final get = await SharedPreferences.getInstance();
    return (DreamDestination(
      hasVisited: get.getBool("hasVisited") ?? false,
      visitCount: get.getInt("visitCount") ?? 0,
      destination: get.getString("destination") ?? "",
    ));
  }
}
