import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoChangeScreen extends StatefulWidget {
  PhotoChangeScreen({super.key});

  @override
  State<PhotoChangeScreen> createState() => _PhotoChangeScreenState();
}

class _PhotoChangeScreenState extends State<PhotoChangeScreen> {
  final ImagePicker picker = ImagePicker();

  Future<void> pickPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (!mounted || image == null) return;

    Navigator.pop(context, image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo Change')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: pickPhoto,
          icon: const Icon(Icons.photo_library),
          label: const Text('Change Photo'),
        ),
      ),
    );
  }
}
