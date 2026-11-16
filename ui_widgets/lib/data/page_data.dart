import 'package:flutter/material.dart';

import '../models/page_model.dart';

const List<PageModel> pages = [
  PageModel(
    title: 'Welcome to the Kingdom',
    subtitle: 'Discover the magical world!',
    imagePath: 'assets/images/castle.png',
    backgroundColor: Colors.purpleAccent,
  ),
  PageModel(
    title: 'Explore New Places',
    subtitle: 'Travel through beautiful lands!',
    imagePath: 'assets/images/forest.png',
    backgroundColor: Colors.lightBlueAccent,
  ),
  PageModel(
    title: 'Begin Your Journey',
    subtitle: 'Your adventure starts here!',
    imagePath: 'assets/images/prince.png',
    backgroundColor: Colors.lightGreenAccent,
  ),
];
