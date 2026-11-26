import 'package:flutter/material.dart';

import 'quick_action_button.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: QuickActionButton(
            title: 'Add Expense',
            icon: Icons.add_circle_outline,
            onTap: () {
              debugPrint('Add Expense');
            },
          ),
        ),

        const SizedBox(width: 8),

        Flexible(
          flex: 1,
          child: QuickActionButton(
            title: 'Transfer Funds',
            icon: Icons.swap_horiz,
            onTap: () {
              debugPrint('Transfer Funds');
            },
          ),
        ),

        const SizedBox(width: 8),

        Flexible(
          flex: 1,
          child: QuickActionButton(
            title: 'Budget',
            icon: Icons.pie_chart,
            onTap: () {
              debugPrint('Budget');
            },
          ),
        ),
      ],
    );
  }
}
