import 'package:flutter/material.dart';

import '../models/profile_option_model.dart';
import 'profile_option_tile.dart';

class ProfileOptionsList extends StatelessWidget {
  final List<ProfileOptionModel> options;
  final String fontFamily;

  const ProfileOptionsList({
    super.key,
    required this.options,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) {
        return ProfileOptionTile(option: option, fontFamily: fontFamily);
      }).toList(),
    );
  }
}
