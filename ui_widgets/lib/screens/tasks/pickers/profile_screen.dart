import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/profile_option_list.dart';

import '../../../models/profile_option_model.dart';
import '../../../models/user_profile_model.dart';

import 'color_picker_screen.dart';
import 'date_picker_screen.dart';
import 'font_picker_screen.dart';
import 'photo_picker_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProfileModel user = UserProfileModel(
    name: 'Tony Stark',
    dateOfBirth: DateTime(1970, 1, 1),
    fontFamily: 'Arial',
    backgroundColor: Colors.white,
    newImage: '',
  );

  Future<void> changeFont() async {
    final String? selectedFont = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => FontPickerScreen(initialFont: user.fontFamily),
      ),
    );

    if (!mounted || selectedFont == null) return;

    setState(() {
      user.fontFamily = selectedFont;
    });
  }

  Future<void> getChangeImage() async {
    final String? newImage = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => PhotoChangeScreen()),
    );

    if (!mounted || newImage == null) return;

    setState(() {
      user.newImage = newImage;
    });
  }

  Future<void> changeBackgroundColor() async {
    final Color? selectedColor = await Navigator.push<Color>(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ColorPickerScreen(initialColor: user.backgroundColor),
      ),
    );

    if (!mounted || selectedColor == null) return;

    setState(() {
      user.backgroundColor = selectedColor;
    });
  }

  Future<void> changeDateOfBirth() async {
    final DateTime? selectedDate = await Navigator.push<DateTime>(
      context,
      MaterialPageRoute(
        builder: (context) => DatePickerScreen(initialDate: user.dateOfBirth),
      ),
    );

    if (!mounted || selectedDate == null) return;

    setState(() {
      user.dateOfBirth = selectedDate;
    });
  }

  List<ProfileOptionModel> get options => [
    ProfileOptionModel(
      title: 'Change Photo',
      icon: Icons.image,
      onTap: getChangeImage,
    ),
    ProfileOptionModel(
      title: 'Change Font',
      icon: Icons.font_download,
      onTap: changeFont,
    ),
    ProfileOptionModel(
      title: 'Select Birth Date',
      icon: Icons.calendar_month,
      onTap: changeDateOfBirth,
    ),
    ProfileOptionModel(
      title: 'Background Color',
      icon: Icons.palette,
      onTap: changeBackgroundColor,
    ),
  ];

  int get age {
    final now = DateTime.now();

    int ageCount = now.year - user.dateOfBirth.year;

    if (now.month < user.dateOfBirth.month ||
        (now.month == user.dateOfBirth.month &&
            now.day < user.dateOfBirth.day)) {
      ageCount--;
    }

    return ageCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: user.backgroundColor,
      appBar: AppBar(
        title: const Text('Profile Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File(user.newImage)),
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: user.fontFamily,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Age: $age',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: user.fontFamily,
                ),
              ),

              const SizedBox(height: 24),

              ProfileOptionsList(options: options, fontFamily: user.fontFamily),
            ],
          ),
        ),
      ),
    );
  }
}
