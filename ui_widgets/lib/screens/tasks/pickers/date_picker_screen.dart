import 'package:flutter/material.dart';
import 'package:ui_widgets/widgets/custom_app_bar.dart';

class DatePickerScreen extends StatefulWidget {
  late DateTime initialDate;
  DatePickerScreen({super.key, required this.initialDate});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime? selectedDate;

  void chanegeDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Date Picker', subtitle: 'FLUTTER CHALLENGE'),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (selectedDate != null) {
              chanegeDate(selectedDate);
              Navigator.pop(context, selectedDate);
            }
          },
          child: const Text('Pick a Date'),
        ),
      ),
    );
  }
}
