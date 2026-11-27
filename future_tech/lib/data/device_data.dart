import '../models/smart_device.dart';

const List<SmartDevice> device = [
  SmartDevice(
    id: 1,
    name: 'Smart Light',
    room: 'Living Room',
    imagePath: 'assets/images/light.png',
    isOn: true,
  ),
  SmartDevice(
    id: 2,
    name: 'Air Conditioner',
    room: 'Bedroom',
    imagePath: 'assets/images/ac.png',
    isOn: false,
  ),
  SmartDevice(
    id: 3,
    name: 'Smart TV',
    room: 'Living Room',
    imagePath: 'assets/images/tv.png',
    isOn: true,
  ),
  SmartDevice(
    id: 4,
    name: 'Robot Vacuum',
    room: 'Kitchen',
    imagePath: 'assets/images/vacuum.png',
    isOn: false,
  ),
];
