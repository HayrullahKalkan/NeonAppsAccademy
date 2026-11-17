import 'package:ui_widgets/screens/tasks/button_screen/button_screen.dart';
import 'package:ui_widgets/screens/tasks/gallery_screen.dart';
import 'package:ui_widgets/screens/tasks/textfile_screen/queen_screen.dart';
import 'package:ui_widgets/screens/tasks/sliders/dragon_slider_screen.dart';
import 'package:ui_widgets/screens/tasks/switches/switch_screen.dart';
import 'package:ui_widgets/screens/tasks/page_control/page_control_screen.dart';
import 'package:ui_widgets/screens/tasks/segmented_controls/segmented_screen.dart';
import 'package:ui_widgets/screens/tasks/allert_controlles/alert_screen.dart';
import 'package:ui_widgets/screens/tasks/search_bar/search_bar_screen.dart';
import 'package:ui_widgets/screens/tasks/data_table/titanic_screen.dart';

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

  TaskCardModel(
    title: 'Sliders',
    description: 'Slider Widgets Challenge',
    page: const DragonSliderScreen(),
  ),

  TaskCardModel(
    title: 'Switches',
    description: 'Switch Widgets Challenge',
    page: const SwitchScreen(),
  ),

  TaskCardModel(
    title: 'PageControl',
    description: 'PageControl Widgets Challenge',
    page: const PageControlScreen(),
  ),

  TaskCardModel(
    title: 'Segmented Controls',
    description: 'Segmented Controls Widgets Challenge',
    page: const SegmentedScreen(),
  ),
  TaskCardModel(
    title: 'Alert Controls',
    description: 'Alert Controls Widgets Challenge',
    page: const AlertScreen(),
  ),
  TaskCardModel(
    title: 'SearchBar',
    description: 'SearchBar Widgets Challenge',
    page: const SearchbarScreen(),
  ),
  TaskCardModel(
    title: 'DataTable',
    description: 'DataTable Widgets Challenge',
    page: const TitanicScreen(),
  ),
  /*TaskCardModel(title: 'Steppers', description: 'Stepper Widgets Challenge'),*/
];
