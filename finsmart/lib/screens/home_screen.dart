import 'package:flutter/material.dart';

import '../data/account_data.dart';
import '../widgets/account_card.dart';
import '../widgets/balance_widget.dart';
import '../widgets/welcome_header.dart';
import '../widgets/quick_actions.dart';
import '../widgets/expense_summary.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FinSmart')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeHeader(),

            const SizedBox(height: 20),

            BalanceWidget(accountsList: accountList),

            const SizedBox(height: 20),

            const Text(
              'Your Accounts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            ...accountList.map((account) => AccountCard(account: account)),

            const SizedBox(height: 20),

            const ExpenseSummary(income: 32000, expenses: 12400),

            const SizedBox(height: 20),

            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            const QuickActions(),
          ],
        ),
      ),
    );
  }
}
