import 'package:ui_widgets/models/task_card_model.dart';
import 'package:flutter/material.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task1.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task2.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task3.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task4.dart';
import 'package:ui_widgets/screens/tasks/button_screen/task5.dart';

final List<TaskCardModel> buttonTasks = [
  TaskCardModel(
    title: "TASK 1",
    description: "PopupMenuButton",
    icon: const Icon(Icons.menu),
    page: const Task1(),
  ),
  TaskCardModel(
    title: "TASK 2",
    description: "Custom Button Design",
    icon: const Icon(Icons.add),
    page: Task2(),
  ),
  TaskCardModel(
    title: "TASK 3",
    description: "GestureDetector / InkWell",
    icon: const Icon(Icons.touch_app),
    page: Task3(),
  ),
  TaskCardModel(
    title: "TASK 4",
    description: "Button State Management",
    icon: const Icon(Icons.settings),
    page: Task4(),
  ),
  TaskCardModel(
    title: "TASK 5",
    icon: const Icon(Icons.animation),
    description: "AnimationController ve ses",
    page: Task5(),
  ),
];
