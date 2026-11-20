import 'package:flutter/material.dart';

import '../models/profile_option_model.dart';

class ProfileOptionTile extends StatelessWidget {
  final ProfileOptionModel option;
  final String fontFamily;

  const ProfileOptionTile({
    super.key,
    required this.option,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(option.icon),
      title: Text(option.title, style: TextStyle(fontFamily: fontFamily)),
      trailing: const Icon(Icons.chevron_right),
      onTap: option.onTap,
    );
  }
}
