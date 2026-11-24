import 'package:flutter/material.dart';

import '../data/home_tasks.dart';
import '../widgets/task_card.dart';
import '../utils/navigation_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF101A30),
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF293B65),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.code_rounded,
                color: Color(0xFFB9A5FF),
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'NEON ACADEMY',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 1.5,
                    color: Color(0xFF9EAEC9),
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Widget Lab',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color(0xFF263653),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.layers_outlined, size: 23),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TaskList(
          tasks: homeTasks,
          onTaskTap: (task) {
            navigateToTask(context, task.page);
          },
        ),
      ),
    );
  }
}
