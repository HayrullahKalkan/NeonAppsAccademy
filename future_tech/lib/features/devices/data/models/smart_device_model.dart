import '../../domain/entities/smart_device.dart';

class SmartDeviceModel extends SmartDevice {
  const SmartDeviceModel({
    required super.id,
    required super.name,
    required super.room,
    required super.imagePath,
    required super.isOn,
  });
  factory SmartDeviceModel.fromJson(Map<String, dynamic> json) {
    return SmartDeviceModel(
      id: json['id'] as int,
      name: json['name'] as String,
      room: json['room'] as String,
      imagePath: json['image_path'] as String,
      isOn: json['is_on'] as bool,
    );
  }
}
