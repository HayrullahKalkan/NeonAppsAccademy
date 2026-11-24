import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class SteppersScreen extends StatefulWidget {
  const SteppersScreen({super.key});

  @override
  State<SteppersScreen> createState() => _SteppersScreenState();
}

class _SteppersScreenState extends State<SteppersScreen> {
  int _currentStep = 0;

  void increment() {
    setState(() {
      if (_currentStep >= 0 && _currentStep < 50) {
        _currentStep += 5;
      }
    });
  }

  void decrement() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep -= 5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Steppers', subtitle: 'FLUTTER CHALLENGE'),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Value: $_currentStep',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: decrement,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                InkWell(
                  onTap: increment,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
