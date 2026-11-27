import '../models/smart_device.dart';

class DeviceState {
  final List<SmartDevice> devices;

  const DeviceState({required this.devices});

  DeviceState copyWith({List<SmartDevice>? devices}) {
    return DeviceState(devices: devices ?? this.devices);
  }

  int get totalDeviceCount {
    return devices.length;
  }

  int get activeDeviceCount {
    return devices.where((device) => device.isOn).length;
  }
}
