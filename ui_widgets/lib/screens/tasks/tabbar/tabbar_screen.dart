import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hulk TabBar'),
          backgroundColor: Colors.green,
        ),

        body: const TabBarView(
          children: [
            Center(child: Text('Home Screen')),
            Center(child: Text('Missions Screen')),
            Center(child: Text('Alerts Screen')),
            Center(child: Text('Profile Screen')),
          ],
        ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(12),
          clipBehavior: Clip.antiAlias,
          child: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.shield), text: 'Missions'),
              Tab(icon: Icon(Icons.notifications), text: 'Alerts'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
