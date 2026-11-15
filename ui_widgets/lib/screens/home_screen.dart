import 'package:flutter/material.dart';

import '../data/home_tasks.dart';
import '../widgets/task_card.dart';
import '../utils/navigation_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Uİ Widgets')),
      body: TaskList(
        tasks: homeTasks,
        onTaskTap: (task) {
          navigateToTask(context, task.page);
        },
      ),
    );
  }
}
