import 'package:flutter/material.dart';

import 'dart:async';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});
  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  int remainingSeconds = 15;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 1) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();

        setState(() {
          remainingSeconds = 0;
        });
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Decryption')),
      body: Center(
        child: Column(
          children: [
            Text('decrypting...'),
            CircularProgressIndicator(),
            Text('$remainingSeconds seconds remaining'),
          ],
        ),
      ),
    );
  }
}
