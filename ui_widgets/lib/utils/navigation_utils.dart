import 'package:flutter/material.dart';

import '../screens/tasks/gallery_screen.dart';

import '../screens/tasks/button_screen/button_screen.dart';

void navigateToTask(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
