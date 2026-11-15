import 'package:ui_widgets/models/task_card_model.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task1.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task2.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task3.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task4.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task5.dart';

final List<TaskCardModel> buttonTasks = [
  TaskCardModel(
    title: "TASK 1",
    description: "PopupMenuButton",
    page: const Task1(),
  ),
  TaskCardModel(
    title: "TASK 2",
    description: "Custom Button Design",
    page: Task2(),
  ),
  TaskCardModel(
    title: "TASK 3",
    description: "GestureDetector / InkWell",
    page: Task3(),
  ),
  TaskCardModel(
    title: "TASK 4",
    description: "Button State Management",
    page: Task4(),
  ),
  TaskCardModel(
    title: "TASK 5",
    description: "AnimationController ve ses",
    page: Task5(),
  ),
];
