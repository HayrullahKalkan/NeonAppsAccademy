import 'package:flutter/material.dart';

class FinancialAccount {
  final String name;
  final String type;
  final double balance;
  final IconData icon;

  FinancialAccount({
    required this.name,
    required this.type,
    required this.balance,
    required this.icon,
  });
}
