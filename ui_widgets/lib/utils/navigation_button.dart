import 'package:flutter/material.dart';

import '../screens/tasks/button_screen/task1.dart';

void navigation_button(BuildContext context, String title) {
  switch (title) {
    case 'TASK 1':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Task1()),
      );
      break;
    case 'TASK 2':
    case 'TASK 3':
    case 'TASK 4':
    case 'TASK 5':
  }
}
