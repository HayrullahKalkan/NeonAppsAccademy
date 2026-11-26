import 'package:finsmart/models/financial_account.dart';
import 'package:flutter/material.dart';

List<FinancialAccount> accountList = [
  FinancialAccount(
    name: 'Main Account',
    type: 'Checking Account',
    balance: 25000.00,
    icon: Icons.account_balance_wallet,
  ),
  FinancialAccount(
    name: 'Savings',
    type: 'Savings Account',
    balance: 15000.00,
    icon: Icons.savings,
  ),
  FinancialAccount(
    name: 'Investment',
    type: 'Investment Account',
    balance: 8000.00,
    icon: Icons.trending_up,
  ),
];
