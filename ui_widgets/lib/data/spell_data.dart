import 'package:flutter/material.dart';

import '/models/spell_model.dart';

final List<SpellModel> spells = [
  SpellModel(
    title: 'Expelliarmus',
    icon: Icons.flash_on,
    alignment: Alignment.topLeft,
  ),
  SpellModel(
    title: 'Lumos',
    icon: Icons.light_mode,
    alignment: Alignment.topRight,
  ),
  SpellModel(
    title: 'Protego',
    icon: Icons.shield,
    alignment: Alignment.bottomLeft,
  ),
  SpellModel(
    title: 'Expecto Patronum',
    icon: Icons.auto_awesome,
    alignment: Alignment.bottomRight,
  ),
];
