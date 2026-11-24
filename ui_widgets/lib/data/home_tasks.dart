import 'package:flutter/material.dart';

import 'package:ui_widgets/screens/tasks/button_screen/button_screen.dart';
import 'package:ui_widgets/screens/tasks/container/gallery_screen.dart';
import 'package:ui_widgets/screens/tasks/grid_view/neon_apps_screen.dart';
import 'package:ui_widgets/screens/tasks/list_view/list_view_screen.dart';
import 'package:ui_widgets/screens/tasks/linear_progress_indicators/linear_progress_screen.dart';
import 'package:ui_widgets/screens/tasks/pickers/profile_screen.dart';
import 'package:ui_widgets/screens/tasks/scroll_view/iron_man_scroll_screen.dart';
import 'package:ui_widgets/screens/tasks/stack_views/stack_views_screen.dart';
import 'package:ui_widgets/screens/tasks/tabbar/tabbar_screen.dart';
import 'package:ui_widgets/screens/tasks/textfile_screen/queen_screen.dart';
import 'package:ui_widgets/screens/tasks/sliders/dragon_slider_screen.dart';
import 'package:ui_widgets/screens/tasks/switches/switch_screen.dart';
import 'package:ui_widgets/screens/tasks/page_control/page_control_screen.dart';
import 'package:ui_widgets/screens/tasks/segmented_controls/segmented_screen.dart';
import 'package:ui_widgets/screens/tasks/allert_controlles/alert_screen.dart';
import 'package:ui_widgets/screens/tasks/search_bar/search_bar_screen.dart';
import 'package:ui_widgets/screens/tasks/data_table/titanic_screen.dart';
import 'package:ui_widgets/screens/tasks/steppers/steppers_screen.dart';
import 'package:ui_widgets/screens/tasks/circular_progress_indicator/circular_progress_screen.dart';

import '../models/task_card_model.dart';

final List<TaskCardModel> homeTasks = [
  TaskCardModel(
    title: 'Container',
    description: 'Container Widgets and Image Gallery Challenge',
    icon: const Icon(Icons.image_outlined, color: Colors.blue, size: 30),
    page: const GalleryScreen(),
  ),

  TaskCardModel(
    title: 'Buttons',
    description: 'Button Widgets and Six-Shooters Challenge',
    icon: const Icon(
      Icons.smart_button_outlined,
      color: Colors.deepPurple,
      size: 30,
    ),
    page: const ButtonScreen(),
  ),

  TaskCardModel(
    title: 'TextField',
    description: 'TextField Widgets Challenge',
    icon: const Icon(Icons.text_fields, color: Colors.teal, size: 30),
    page: const QueenScreen(),
  ),

  TaskCardModel(
    title: 'Sliders',
    description: 'Slider Widgets Challenge',
    icon: const Icon(Icons.tune, color: Colors.orange, size: 30),
    page: const DragonSliderScreen(),
  ),

  TaskCardModel(
    title: 'Switches',
    description: 'Switch Widgets Challenge',
    icon: const Icon(Icons.toggle_on_outlined, color: Colors.green, size: 30),
    page: const SwitchScreen(),
  ),

  TaskCardModel(
    title: 'Segmented Controls',
    description: 'Segmented Controls Widgets Challenge',
    icon: const Icon(Icons.view_week_outlined, color: Colors.indigo, size: 30),
    page: const SegmentedScreen(),
  ),

  TaskCardModel(
    title: 'Alert Controls',
    description: 'Alert Controls Widgets Challenge',
    icon: const Icon(
      Icons.notification_important_outlined,
      color: Colors.redAccent,
      size: 30,
    ),
    page: const AlertScreen(),
  ),

  TaskCardModel(
    title: 'SearchBar',
    description: 'SearchBar Widgets Challenge',
    icon: const Icon(Icons.search, color: Colors.cyan, size: 30),
    page: const SearchbarScreen(),
  ),

  TaskCardModel(
    title: 'DataTable',
    description: 'DataTable Widgets Challenge',
    icon: const Icon(
      Icons.table_chart_outlined,
      color: Colors.blueGrey,
      size: 30,
    ),
    page: const TitanicScreen(),
  ),

  TaskCardModel(
    title: 'Circular Progress',
    description: 'Circular Progress Indicator Widgets Challenge',
    icon: const Icon(Icons.donut_large, color: Colors.purple, size: 30),
    page: const CircularProgressScreen(),
  ),

  TaskCardModel(
    title: 'Steppers',
    description: 'Stepper Widgets Challenge',
    icon: const Icon(
      Icons.format_list_numbered,
      color: Colors.deepOrange,
      size: 30,
    ),
    page: const SteppersScreen(),
  ),

  TaskCardModel(
    title: 'Linear Progress',
    description: 'Linear Progress Indicator Widgets Challenge',
    icon: const Icon(Icons.linear_scale, color: Colors.lightGreen, size: 30),
    page: const LinearProgressScreen(),
  ),

  TaskCardModel(
    title: 'Page Control',
    description: 'Page Control Widgets Challenge',
    icon: const Icon(Icons.swipe_outlined, color: Colors.amber, size: 30),
    page: const PageControlScreen(),
  ),

  TaskCardModel(
    title: 'ListView Controls',
    description: 'ListView Controls Widgets Challenge',
    icon: const Icon(Icons.view_list_outlined, color: Colors.blue, size: 30),
    page: const ListViewScreen(),
  ),

  TaskCardModel(
    title: 'TabBar',
    description: 'TabBar Controls Widgets Challenge',
    icon: const Icon(Icons.tab_outlined, color: Colors.deepPurple, size: 30),
    page: const TabBarScreen(),
  ),

  TaskCardModel(
    title: 'Pickers',
    description: 'Picker Widgets Challenge',
    icon: const Icon(Icons.date_range_outlined, color: Colors.pink, size: 30),
    page: const ProfileScreen(),
  ),

  TaskCardModel(
    title: 'Stack View',
    description: 'Stack View Widgets Challenge',
    icon: const Icon(Icons.layers_outlined, color: Colors.brown, size: 30),
    page: const StackViewScreen(),
  ),

  TaskCardModel(
    title: 'Scroll View',
    description: 'Scroll View Widgets Challenge',
    icon: const Icon(Icons.swap_vert, color: Colors.teal, size: 30),
    page: const IronManScrollScreen(),
  ),

  TaskCardModel(
    title: 'Neon Apps',
    description: 'Neon Apps GridView Challenge',
    icon: const Icon(
      Icons.grid_view_rounded,
      color: Colors.indigoAccent,
      size: 30,
    ),
    page: const NeonAppsScreen(),
  ),
];
