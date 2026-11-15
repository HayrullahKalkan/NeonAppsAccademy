import 'package:flutter/widgets.dart';

class TaskCardModel {
  final String title;
  final String description;
  final Widget page;
  const TaskCardModel({
    required this.title,
    required this.description,
    required this.page,
  });
}
