import 'package:flutter/material.dart';
import 'package:sophia/custom_widgets/custom_text.dart';

class PhotosListCard extends StatelessWidget {
  final String image;

  const PhotosListCard({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(image),
    );
  }
}
