import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  String lastAction = 'No action yet';

  void updateAction(String action) {
    setState(() {
      lastAction = action;
    });
    debugPrint(action);
  }

  // Task 1: Alert without buttons
  void showNoButtonAlert() {
    showDialog(
      context: context,
      builder: (dialogContext) => const AlertDialog(
        title: Text('Magic Message'),
        content: Text('Pinocchio has entered the academy!'),
      ),
    );
  }

  // Task 2: Alert with one button
  void showOneButtonAlert() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Welcome'),
        content: const Text('Are you ready to learn?'),
        actions: [
          TextButton(
            onPressed: () {
              updateAction('OK');
              Navigator.pop(dialogContext);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Task 3: Alert with two buttons
  void showTwoButtonAlert() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Important Decision'),
        content: const Text('Do you want to join the adventure?'),
        actions: [
          TextButton(
            onPressed: () {
              updateAction('Cancel');
              Navigator.pop(dialogContext);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              updateAction('Accept');
              Navigator.pop(dialogContext);
            },
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  // Task 4: Alert with TextField
  Future<void> showTextFieldAlert() async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Tell the Truth'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter your message',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              updateAction(controller.text);
              Navigator.pop(dialogContext);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );

    controller.dispose();
  }

  // Task 5: Action Sheet
  void showActionSheet() {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              title: Text('Choose an Action'),
              subtitle: Text('What would you like to do?'),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                updateAction('Camera');
                Navigator.pop(sheetContext);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () {
                updateAction('Gallery');
                Navigator.pop(sheetContext);
              },
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Cancel'),
              onTap: () {
                Navigator.pop(sheetContext);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pinocchio Alert Adventure')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: showNoButtonAlert,
            child: const Text('No Button Alert'),
          ),
          ElevatedButton(
            onPressed: showOneButtonAlert,
            child: const Text('One Button Alert'),
          ),
          ElevatedButton(
            onPressed: showTwoButtonAlert,
            child: const Text('Two Button Alert'),
          ),
          ElevatedButton(
            onPressed: showTextFieldAlert,
            child: const Text('TextField Alert'),
          ),
          ElevatedButton(
            onPressed: showActionSheet,
            child: const Text('Action Sheet'),
          ),
          const SizedBox(height: 24),
          Text('Last action: $lastAction', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
