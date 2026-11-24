import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class Task3 extends StatefulWidget {
  const Task3({super.key});

  @override
  State<Task3> createState() => _Task3State();
}

class _Task3State extends State<Task3> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Gesture Detector',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: Center(
        child: GestureDetector(
          onTapDown: (details) {
            setState(() {
              isPressed = true;
            });
          },
          onTapUp: (details) {
            setState(() {
              isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              isPressed = false;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            width: 250,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isPressed ? Colors.yellow : Colors.blueGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shield, color: Colors.purple, size: 30),
                SizedBox(width: 10),
                Text(
                  'Vigilante Action',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
