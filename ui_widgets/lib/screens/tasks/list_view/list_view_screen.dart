import 'package:flutter/material.dart';

import '../../../data/list_view_data.dart';
import '../../../widgets/list_view_widgets.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Latest News')),
      body: TaskList(
        tasks: listData,
        onTaskTap: (task) {
          debugPrint(task.title);
        },
      ),
    );
  }
}
