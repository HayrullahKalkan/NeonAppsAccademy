import 'package:flutter/material.dart';

import '../../../data/passenger_data.dart';
import '../../../models/passenger_model.dart';
import 'passenger_detail_screen.dart';

class TitanicScreen extends StatelessWidget {
  const TitanicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Titanic Passengers'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Flutter Team'),
              Tab(text: 'iOS Team'),
              Tab(text: 'Android Team'),
              Tab(text: 'Design Team'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PassengerTable(team: Team.flutter),
            PassengerTable(team: Team.ios),
            PassengerTable(team: Team.android),
            PassengerTable(team: Team.design),
          ],
        ),
      ),
    );
  }
}

class PassengerTable extends StatelessWidget {
  final Team team;

  const PassengerTable({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    final teamPassengers = passengers
        .where((passenger) => passenger.team == team)
        .toList();

    return SingleChildScrollView(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          showCheckboxColumn: false,
          columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Surname')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Hometown')),
            DataColumn(label: Text('Mail')),
          ],
          rows: teamPassengers.map((passenger) {
            return DataRow(
              onSelectChanged: (_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PassengerDetailScreen(passenger: passenger),
                  ),
                );
              },
              cells: [
                DataCell(Text(passenger.name)),
                DataCell(Text(passenger.surname)),
                DataCell(Text('${passenger.age}')),
                DataCell(Text(passenger.hometown)),
                DataCell(Text(passenger.mail)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
