import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

import '../../../data/spell_data.dart';
import '../../../widgets/spell_card.dart';

class StackViewScreen extends StatelessWidget {
  const StackViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101B30),
      appBar: CustomAppBar(
        title: 'Harry Potter Spells',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double cardWidth = (constraints.maxWidth - 16) / 2;

              return Stack(
                fit: StackFit.expand,
                children: spells.map((spell) {
                  return Align(
                    alignment: spell.alignment,
                    child: SpellCard(
                      title: spell.title,
                      icon: spell.icon,
                      width: cardWidth,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
