import 'package:flutter/material.dart';

import '../models/dream_destination.dart';

class AddDestinationScreen extends StatefulWidget {
  final Future<void> Function(DreamDestination) onSave;

  const AddDestinationScreen({super.key, required this.onSave});

  @override
  State<AddDestinationScreen> createState() => _AddDestinationScreenState();
}

class _AddDestinationScreenState extends State<AddDestinationScreen> {
  final destinationController = TextEditingController();
  final visitCountController = TextEditingController(text: '0');

  bool hasVisited = false;
  bool isSaving = false;

  @override
  void dispose() {
    destinationController.dispose();
    visitCountController.dispose();
    super.dispose();
  }

  Future<void> saveDestination() async {
    final destination = destinationController.text.trim();
    final visitCount = int.tryParse(visitCountController.text);

    if (destination.isEmpty || visitCount == null || visitCount < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid destination and visit count.'),
        ),
      );
      return;
    }

    final dream = DreamDestination(
      hasVisited: hasVisited,
      visitCount: visitCount,
      destination: destination,
    );

    setState(() {
      isSaving = true;
    });

    try {
      await widget.onSave(dream);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Destination saved successfully!')),
      );
    } finally {
      if (mounted) {
        setState(() {
          isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Save Your Dream Destination',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: destinationController,
                decoration: const InputDecoration(
                  labelText: 'Destination',
                  hintText: 'For example: Paris',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: visitCountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Visit Count',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.repeat),
                ),
              ),

              const SizedBox(height: 12),

              SwitchListTile(
                title: const Text('Have you visited this place?'),
                value: hasVisited,
                onChanged: (value) {
                  setState(() {
                    hasVisited = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: isSaving ? null : saveDestination,
                icon: const Icon(Icons.save),
                label: Text(isSaving ? 'Saving...' : 'Save Destination'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
