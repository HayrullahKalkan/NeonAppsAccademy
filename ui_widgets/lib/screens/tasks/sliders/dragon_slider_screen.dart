import 'package:flutter/material.dart';

class DragonSliderScreen extends StatefulWidget {
  const DragonSliderScreen({super.key});

  @override
  State<DragonSliderScreen> createState() => _DragonSliderScreenState();
}

class _DragonSliderScreenState extends State<DragonSliderScreen> {
  double dragonPower = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dragon Slayer'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dragon Power: ${dragonPower.toInt()}',
                style: const TextStyle(fontSize: 24),
              ),

              const SizedBox(height: 30),

              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Colors.blue,
                  activeTrackColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                ),
                child: Slider(
                  value: dragonPower,
                  min: 0,
                  max: 50,
                  divisions: 50,
                  label: dragonPower.toInt().toString(),
                  onChanged: (value) {
                    setState(() {
                      dragonPower = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 30),

              Text(
                dragonPower == 50
                    ? 'The Red Dragon Appeared!'
                    : 'Keep increasing the dragon power!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
