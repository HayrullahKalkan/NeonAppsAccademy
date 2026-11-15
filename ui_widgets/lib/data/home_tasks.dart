import 'package:ui_widgets/screens/tasks/button_screen/button_screen.dart';
import 'package:ui_widgets/screens/tasks/gallery_screen.dart';
import 'package:ui_widgets/screens/tasks/textfile_screen/queen_screen.dart';

import '../models/task_card_model.dart';

final List<TaskCardModel> homeTasks = [
  TaskCardModel(
    title: 'Container',
    description: 'Container Widgets and Image Gallery Challenge',
    page: const GalleryScreen(),
  ),

  TaskCardModel(
    title: 'Buttons',
    description: 'Button Widgets and Six-Shooters Challenge',
    page: const ButtonScreen(),
  ),

  TaskCardModel(
    title: 'TextField',
    description: 'TextField Widgets Challenge',
    page: const QueenScreen(),
  ),

  /*TaskCardModel(title: 'Sliders', description: 'Slider Widgets Challenge'),

  TaskCardModel(title: 'Switches', description: 'Switch Widgets Challenge'),

  TaskCardModel(title: 'Steppers', description: 'Stepper Widgets Challenge'),*/
];
