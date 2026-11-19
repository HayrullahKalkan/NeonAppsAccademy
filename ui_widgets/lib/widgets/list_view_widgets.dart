import 'package:flutter/material.dart';

import '../models/list_view_model.dart';

class TaskList extends StatelessWidget {
  final List<ListViewModel> tasks;
  final Function(ListViewModel) onTaskTap;

  const TaskList({super.key, required this.tasks, required this.onTaskTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return Card(
          child: ListTile(
            leading: Image.network(
              task.imageUrl,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => onTaskTap(task),
          ),
        );
      },
    );
  }
}
