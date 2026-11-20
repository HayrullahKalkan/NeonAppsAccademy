import 'package:flutter/material.dart';

class ProfileOptionModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileOptionModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
