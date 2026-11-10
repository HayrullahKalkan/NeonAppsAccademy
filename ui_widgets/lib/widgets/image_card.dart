import 'package:flutter/material.dart';

import '../models/image_model.dart';

class ImageCard extends StatelessWidget {
  final ImageModel image;

  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              image.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(padding: const EdgeInsets.all(8)),
        ],
      ),
    );
  }
}
