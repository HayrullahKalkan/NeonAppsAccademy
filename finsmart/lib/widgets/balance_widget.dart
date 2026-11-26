import 'package:flutter/material.dart';

import '../models/financial_account.dart';

class BalanceWidget extends StatelessWidget {
  final List<FinancialAccount> accountsList;

  const BalanceWidget({
    super.key,
    required this.accountsList,
  });

  double get totalBalance {
    return accountsList.fold<double>(
      0.0,
      (sum, account) => sum + account.balance,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${totalBalance.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}