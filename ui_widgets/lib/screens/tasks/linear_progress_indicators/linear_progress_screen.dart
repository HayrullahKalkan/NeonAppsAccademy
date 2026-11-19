import 'package:flutter/material.dart';

class LinearProgressScreen extends StatefulWidget {
  const LinearProgressScreen({super.key});

  @override
  State<LinearProgressScreen> createState() => _LinearProgressScreenState();
}

class _LinearProgressScreenState extends State<LinearProgressScreen> {
  int counter = 0;

  void startCounter() {
    setState(() {
      if (counter == 10) {
        counter = 0;
      } else {
        counter++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Linear Progress Indicator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                value: counter / 10,
                minHeight: 10,
                backgroundColor: Colors.black,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Text('Progress: $counter/10'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: startCounter,
              child: const Text('Increment Progress'),
            ),
          ],
        ),
      ),
    );
  }
}
