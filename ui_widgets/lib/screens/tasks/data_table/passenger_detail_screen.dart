import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

import '../../../models/passenger_model.dart';

class PassengerDetailScreen extends StatelessWidget {
  final PassengerModel passenger;

  const PassengerDetailScreen({super.key, required this.passenger});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Passenger Details'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 45, child: Icon(Icons.person, size: 45)),
          const SizedBox(height: 20),
          Text(
            '${passenger.name} ${passenger.surname}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ListTile(
            leading: const Icon(Icons.groups),
            title: const Text('Team'),
            subtitle: Text(passenger.team.name),
          ),
          ListTile(
            leading: const Icon(Icons.cake),
            title: const Text('Age'),
            subtitle: Text('${passenger.age}'),
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Hometown'),
            subtitle: Text(passenger.hometown),
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text('Email'),
            subtitle: Text(passenger.mail),
          ),
        ],
      ),
    );
  }
}
