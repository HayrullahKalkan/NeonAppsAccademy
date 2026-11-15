import 'package:flutter/material.dart';
import 'package:ui_widgets/utils/navigation_utils.dart';

import '../../../data/button_data.dart';
import '../../../widgets/task_card.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BUTTON Widgets')),
      body: TaskList(
        tasks: buttonTasks,
        onTaskTap: (task) {
          navigateToTask(context, task.page);
        },
      ),
    );
  }
}
