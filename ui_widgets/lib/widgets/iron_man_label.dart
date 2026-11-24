import 'package:flutter/material.dart';

class IronManLabel extends StatelessWidget {
  final String title;
  final double height;

  const IronManLabel({super.key, required this.title, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade900,
        border: Border.all(color: Colors.orange),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
