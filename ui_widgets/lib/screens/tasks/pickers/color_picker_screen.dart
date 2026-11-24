import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class ColorPickerScreen extends StatefulWidget {
  late Color initialColor;
  ColorPickerScreen({super.key, required this.initialColor});

  @override
  State<ColorPickerScreen> createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color? selectedColor;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
  }

  void changeColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Color Picker',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              value: selectedColor,
              items: const [
                DropdownMenuItem(value: Colors.white, child: Text('White')),
                DropdownMenuItem(value: Colors.red, child: Text('Red')),
                DropdownMenuItem(value: Colors.green, child: Text('Green')),
                DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
              ],
              onChanged: (Color? value) {
                if (value == null) return;
                changeColor(value);
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, selectedColor),
              child: const Text('Change Color'),
            ),
            Container(width: 100, height: 100, color: selectedColor),
          ],
        ),
      ),
    );
  }
}
