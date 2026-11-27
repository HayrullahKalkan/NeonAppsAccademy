import 'package:flutter/material.dart';
import 'package:future_tech/models/smart_device.dart';

class DeviceCard extends StatelessWidget {
  final SmartDevice device;
  final VoidCallback onToggle;

  const DeviceCard({required this.device, required this.onToggle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: device.isOn ? const Color(0xFF15383D) : const Color(0xFF1A2333),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: device.isOn
              ? const Color(0xFF34736D)
              : const Color(0xFF2A3547),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                device.imagePath,
                width: 48,
                height: 48,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              Switch(
                value: device.isOn,
                onChanged: (value) {
                  onToggle();
                },
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            device.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(device.room, style: const TextStyle(color: Colors.white54)),

          const SizedBox(height: 8),
          const Divider(color: Colors.white24),

          Row(
            children: [
              Icon(
                Icons.power_settings_new,
                color: device.isOn ? Colors.greenAccent : Colors.redAccent,
              ),
              const SizedBox(width: 8),
              Text(
                device.isOn ? 'ON' : 'OFF',
                style: TextStyle(
                  color: device.isOn ? Colors.greenAccent : Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
