import 'package:flutter/material.dart';

class PageModel {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color backgroundColor;

  const PageModel({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.backgroundColor,
  });
}
