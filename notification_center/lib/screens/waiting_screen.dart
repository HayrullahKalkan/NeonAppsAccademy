import 'package:flutter/material.dart';

import 'dart:async';

import '../services/notification_service.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  int remainingSeconds = 15;

  Timer? countdownTimer;
  Timer? messageTimer;

  String? decryptedMessage;
  StreamSubscription<String>? messageSubscription;

  @override
  void initState() {
    super.initState();

    messageSubscription = NotificationService.onMessage.listen((message) {
      if (!mounted) return;

      setState(() {
        decryptedMessage = message;
      });

      messageTimer?.cancel();

      messageTimer = Timer(const Duration(seconds: 5), () {
        if (!mounted) return;

        setState(() {
          decryptedMessage = null;
        });
      });
    });

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

        NotificationService.sendNotification(
          "The secret message has been decoded!",
        );
      }
    });
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    messageTimer?.cancel();
    messageSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1220),

      appBar: AppBar(
        backgroundColor: const Color(0xFF162235),
        foregroundColor: Colors.white,
        title: const Text("DECRYPTION IN PROGRESS"),
        centerTitle: true,
        leading: const Icon(Icons.radar),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                decryptedMessage == null
                    ? Icons.lock_open
                    : Icons.verified_user,
                size: 70,
                color: const Color(0xFF00E676),
              ),

              const SizedBox(height: 25),

              Text(
                decryptedMessage == null
                    ? "DECRYPTING..."
                    : "DECRYPTION SUCCESS",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              if (remainingSeconds > 0)
                const CircularProgressIndicator(color: Color(0xFF00E676))
              else
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFF00E676),
                  size: 55,
                ),

              const SizedBox(height: 20),

              Text(
                "$remainingSeconds seconds remaining",
                style: const TextStyle(color: Color(0xFF00E676), fontSize: 20),
              ),

              const SizedBox(height: 30),

              if (decryptedMessage != null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF162235),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF00E676)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "DECRYPTED MESSAGE",
                        style: TextStyle(
                          color: Color(0xFF00E676),
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Text(
                        decryptedMessage!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "MESSAGE EXPIRES IN 5 SECONDS",
                        style: TextStyle(color: Colors.white54, fontSize: 11),
                      ),
                    ],
                  ),
                )
              else if (remainingSeconds == 0)
                const Text(
                  "MESSAGE EXPIRED",
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                )
              else
                const Text(
                  "DO NOT CLOSE THIS WINDOW",
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
