import 'package:flutter/material.dart';
import 'package:future_tech/models/smart_device.dart';

import 'device_card.dart';

class DeviceGrid extends StatelessWidget {
  final List<SmartDevice> devices;
  final void Function(int) onDeviceToggle;

  const DeviceGrid({
    required this.devices,
    required this.onDeviceToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        mainAxisExtent: 200,
      ),
      children: devices.map((device) {
        return DeviceCard(
          device: device,
          onToggle: () {
            onDeviceToggle(device.id);
          },
        );
      }).toList(),
    );
  }
}
