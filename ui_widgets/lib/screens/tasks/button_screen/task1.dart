import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Popup menu button',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: PopupMenuButton<String>(
        tooltip: 'Sheriff actions',
        icon: const Icon(Icons.shield_outlined),
        itemBuilder: (context) => const [
          PopupMenuItem(value: 'backup', child: Text('Call for backup')),
          PopupMenuItem(value: 'warning', child: Text('Warn townspeople')),
        ],
        onSelected: (value) {
          switch (value) {
            case 'backup':
              print('backup request');
              break;
            case 'warning':
              print('warningg');
              break;
          }
        },
      ),
    );
  }
}
