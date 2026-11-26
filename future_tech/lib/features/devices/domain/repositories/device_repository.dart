import '../entities/smart_device.dart';

abstract class DeviceRepository {
  Future<List<SmartDevice>> getDevices();

  Future<void> setDevicePower(int id, bool isOn);
}
