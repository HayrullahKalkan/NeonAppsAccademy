import 'package:flutter/material.dart';

import '../models/task_card_model.dart';

class TaskList extends StatelessWidget {
  final List<TaskCardModel> tasks;
  final ValueChanged<TaskCardModel> onTaskTap;

  const TaskList({super.key, required this.tasks, required this.onTaskTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return Card(
          child: ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            leading: task.icon,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => onTaskTap(task),
          ),
        );
      },
    );
  }
}
