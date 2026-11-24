import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class FontPickerScreen extends StatefulWidget {
  final String initialFont;

  const FontPickerScreen({super.key, required this.initialFont});

  @override
  State<FontPickerScreen> createState() => _FontPickerScreenState();
}

class _FontPickerScreenState extends State<FontPickerScreen> {
  late String selectedFont;

  @override
  void initState() {
    super.initState();
    selectedFont = widget.initialFont;
  }

  void changeFont(String font) {
    if (font.isEmpty) return;
    setState(() {
      selectedFont = font;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Font Picker',
        subtitle: 'FLUTTER CHALLENGE',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedFont,
              items: const [
                DropdownMenuItem(value: 'Roboto', child: Text('Roboto')),
                DropdownMenuItem(value: 'Arial', child: Text('Arial')),
                DropdownMenuItem(value: 'Courier', child: Text('Courier')),
              ],
              onChanged: (String? value) {
                if (value == null) return;
                changeFont(value);
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, selectedFont);
              },
              child: const Text('Change Font'),
            ),
            Text(
              'Selected Font: $selectedFont',
              style: TextStyle(fontSize: 24, fontFamily: selectedFont),
            ),
          ],
        ),
      ),
    );
  }
}
