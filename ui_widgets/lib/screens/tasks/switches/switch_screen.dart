import 'package:flutter/material.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isOn ? Colors.green : Colors.red,
      appBar: AppBar(title: const Text('Color Wizard'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isOn ? 'Switch is ON' : 'Switch is OFF',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 24),

            Switch(
              value: isOn,
              activeThumbColor: Colors.black,
              activeTrackColor: Colors.red,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  isOn = value;
                });
              },
            ),

            const SizedBox(height: 12),

            const Text(
              'on-off',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
