import 'package:event_fit/data/publish_seed.dart';
import 'package:event_fit/presentation/pages/home/publish/publish_buttons.dart';
import 'package:event_fit/presentation/pages/home/publish/publish_image.dart';
import 'package:event_fit/presentation/pages/home/publish/publish_text.dart';
import 'package:flutter/material.dart';

class PublishWall extends StatelessWidget {
  PublishWall({super.key});
  final publishes = publishData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: publishes.length,
        itemBuilder: (context, index) {
          final publish = publishes[index];
          return Stack(
            children: [
              PublishImage(imageUrl: publish.imageUrl),
              const PublishButtons(),
              PublishText(
                description: publish.name,
                name: publish.siteDescription,
              )
            ],
          );
        },
      ),
    );
  }
}
