import 'package:event_fit/presentation/pages/home/publish/publish_cover.dart';
import 'package:flutter/material.dart';

class PublishImage extends StatelessWidget {
  const PublishImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox.expand(
        child: Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            fit: BoxFit.fill,
            imageUrl,
            width: size.width,
            height: size.height,
          ),
        ),
        const PublishCover(),
      ],
    ));
  }
}
