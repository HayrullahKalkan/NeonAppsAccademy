import 'package:flutter/material.dart';
import 'package:ui_widgets/utils/navigation_utils.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

import '../../../data/button_data.dart';
import '../../../widgets/task_card.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Buttons',
        subtitle: 'FLUTTER CHALLENGE',
        icon: Icons.smart_button,
      ),
      body: TaskList(
        tasks: buttonTasks,
        onTaskTap: (task) {
          navigateToTask(context, task.page);
        },
      ),
    );
  }
}
