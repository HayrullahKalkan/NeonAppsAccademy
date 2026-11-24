import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

import '../../../data/list_view_data.dart';
import '../../../widgets/list_view_widgets.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'List View',
        subtitle: 'FLUTTER CHALLENGE',
        icon: Icons.list,
      ),
      body: TaskList(
        tasks: listData,
        onTaskTap: (task) {
          debugPrint(task.title);
        },
      ),
    );
  }
}
