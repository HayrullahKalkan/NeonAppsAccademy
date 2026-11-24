import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class SegmentedScreen extends StatefulWidget {
  const SegmentedScreen({super.key});

  @override
  State<SegmentedScreen> createState() => _SegmentedScreenState();
}

class _SegmentedScreenState extends State<SegmentedScreen> {
  String selectedSegment = 'Neon Academy 2023';

  double get segmentWidth {
    switch (selectedSegment) {
      case 'Neon Academy 2023':
        return 350;
      case 'Neon':
        return 280;
      case 'Apps':
        return 220;
      default:
        return 350;
    }
  }

  Color get segmentColor {
    switch (selectedSegment) {
      case 'Neon Academy 2023':
        return const Color(0xFFA3E635);
      case 'Neon':
        return const Color(0xFFF472B6);
      case 'Apps':
        return const Color(0xFF38BDF8);
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Segmented Controls',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Choose a Segment',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'Neon Academy 2023',
                    label: Text('Neon Academy 2023'),
                  ),
                  ButtonSegment(value: 'Neon', label: Text('Neon')),
                  ButtonSegment(value: 'Apps', label: Text('Apps')),
                ],
                selected: {selectedSegment},
                showSelectedIcon: false,
                onSelectionChanged: (newSelection) {
                  setState(() {
                    selectedSegment = newSelection.first;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.selected)) {
                      return segmentColor;
                    }
                    return Colors.grey.shade200;
                  }),
                ),
              ),

              const SizedBox(height: 40),

              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: segmentWidth,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: segmentColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  selectedSegment,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
