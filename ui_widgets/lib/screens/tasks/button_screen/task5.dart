import 'dart:math';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class Task5 extends StatefulWidget {
  const Task5({super.key});

  @override
  State<Task5> createState() => _Task5State();
}

class _Task5State extends State<Task5> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> shakeAnimation;

  final AudioPlayer audioPlayer = AudioPlayer();

  bool isPressed = false;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    shakeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animationController);
  }

  Future<void> shakeVault() async {
    animationController.forward(from: 0);

    await audioPlayer.stop();

    if (!mounted) return;

    await audioPlayer.play(AssetSource('sounds/vault_shake.mp3'));
  }

  @override
  void dispose() {
    animationController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Gesture Detector',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bank Vault',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            AnimatedBuilder(
              animation: shakeAnimation,
              builder: (context, child) {
                double offset =
                    sin(shakeAnimation.value * pi * 12) *
                    12 *
                    (1 - shakeAnimation.value);

                return Transform.translate(
                  offset: Offset(offset, 0),
                  child: child,
                );
              },
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    isPressed = true;
                  });
                },
                onTapUp: (_) {
                  setState(() {
                    isPressed = false;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                onTap: shakeVault,
                child: Image.asset(
                  isPressed
                      ? 'assets/images/vault_active.png'
                      : 'assets/images/vault_closed.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Tap the vault to start the robbery!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
