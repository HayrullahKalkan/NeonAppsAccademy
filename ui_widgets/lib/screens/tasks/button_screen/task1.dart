import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  const Task1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PopUpMenu')),
      body: PopupMenuButton<String>(
        itemBuilder: (context) {
          return [
            PopupMenuItem(value: 'backup', child: Text('Call for backup')),
            PopupMenuItem(value: 'warning', child: Text('Warn townspeople')),
          ];
        },
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
