import 'package:flutter/material.dart';
import 'package:ui_widgets/utils/colors.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({super.key});

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> {
  int counter = 0;
  bool isloading = false;
  
  Future<void> startCounter() async {
    setState(() {
      isloading = true;
      counter = 0;
    });

    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));

      if (!mounted) return;

      setState(() {
        counter = i;
      });
    }

    setState(() {
      isloading = false;
    });
  }

  Color get currentColor {
    return progressColors[counter ~/ 10];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Circular Progress Indicator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isloading)
              CircularProgressIndicator(
                value: counter / 100,
                strokeWidth: 6.0,
                backgroundColor: Colors.grey[300],
                color: currentColor,
              ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(value: counter / 100),
            ),
            const SizedBox(height: 20),
            Text('Progress: $counter%'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isloading ? null : startCounter,
              child: const Text('Start Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
