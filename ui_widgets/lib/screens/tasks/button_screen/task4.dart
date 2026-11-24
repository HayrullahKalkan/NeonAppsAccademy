import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class Task4 extends StatefulWidget {
  const Task4({super.key});

  @override
  State<Task4> createState() => _Task4State();
}

class _Task4State extends State<Task4> {
  bool isShopOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Elevated Button',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.handyman,
              size: 80,
              color: isShopOpen ? Colors.green : Colors.grey,
            ),

            const SizedBox(height: 20),

            Text(
              isShopOpen ? 'Blacksmith is in the shop!' : 'Blacksmith is away!',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  isShopOpen = !isShopOpen;
                });
              },
              child: Text(isShopOpen ? 'Close Shop' : 'Open Shop'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: isShopOpen
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Weapon forged!')),
                      );
                    }
                  : null,
              child: const Text('Forge Weapon'),
            ),
          ],
        ),
      ),
    );
  }
}
