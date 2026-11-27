import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:future_tech/cubit/device_state.dart';
import 'package:future_tech/data/device_data.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(const DeviceState(devices: device));

  void toggleDevice(int deviceId) {
    final updatedDevices = state.devices.map((device) {
      if (device.id == deviceId) {
        return device.copyWith(isOn: !device.isOn);
      }
      return device;
    }).toList();
    emit(DeviceState(devices: updatedDevices));
  }

  void turnAllOff() {
    final updatedDevices = state.devices.map((devices) {
      return devices.copyWith(isOn: false);
    }).toList();
    emit(DeviceState(devices: updatedDevices));
  }
}
