import 'package:flutter/services.dart';

class UserProfileModel {
  String name;
  DateTime dateOfBirth;
  String fontFamily;
  Color backgroundColor;
  String newImage;

  UserProfileModel({
    required this.name,
    required this.dateOfBirth,
    required this.fontFamily,
    required this.backgroundColor,
    required this.newImage,
  });
}
