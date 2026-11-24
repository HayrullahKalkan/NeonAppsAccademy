import 'package:flutter/material.dart';

import '../../../data/image_data.dart';
import '../../../widgets/image_card.dart';
import '../../../widgets/custom_app_bar.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Gallery',
        subtitle: 'FLUTTER CHALLENGE',
        icon: Icons.photo_library,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return ImageCard(image: images[index]);
          },
        ),
      ),
    );
  }
}
