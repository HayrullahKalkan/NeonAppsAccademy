class SmartDevice {
  final int id;
  final String name;
  final String room;
  final String imagePath;
  final bool isOn;

  const SmartDevice({
    required this.id,
    required this.name,
    required this.room,
    required this.imagePath,
    required this.isOn,
  });
  SmartDevice copyWith({
    int? id,
    String? name,
    String? room,
    String? imagePath,
    bool? isOn,
  }) {
    return SmartDevice(
      id: id ?? this.id,
      name: name ?? this.name,
      room: room ?? this.room,
      imagePath: imagePath ?? this.imagePath,
      isOn: isOn ?? this.isOn,
    );
  }
}
