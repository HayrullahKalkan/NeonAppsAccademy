import 'package:flutter/material.dart';
import 'package:ui_widgets/utils/colors.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({super.key});

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen> {
  int counter = 0;
  bool isloading = false;
  Future<void> startCounter() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (!mounted) return;
      setState(() {
        if (i == 100) {
          isloading = true;
        }
        counter = i;
      });

      if (!mounted) return;
    }
  }

  Color get currentColor {
    return progressColors[counter ~/ 10];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Circular Progress Indicator'),
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
