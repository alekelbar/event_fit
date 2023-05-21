import 'package:event_fit/data/publish_seed.dart';
import 'package:event_fit/presentation/pages/home/publish/publish_buttons.dart';
import 'package:event_fit/presentation/pages/home/publish/publish_cover.dart';
import 'package:flutter/material.dart';

class PublishWall extends StatelessWidget {
  PublishWall({super.key});
  final publishes = publishData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textHeader = Theme.of(context).textTheme.headlineSmall;
    final textBody = Theme.of(context).textTheme.bodyLarge;

    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: publishes.length,
        itemBuilder: (context, index) {
          final publish = publishes[index];
          return Stack(
            children: [
              SizedBox.expand(
                  child: Stack(
                children: [
                  Center(
                    child: Image.network(
                      fit: BoxFit.contain,
                      publish.imageUrl,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
                  const PublishCover(),
                ],
              )),
              const Positioned(
                bottom: 20,
                right: 10,
                child: PublishButtons(),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.7,
                      child: Text(
                        textAlign: TextAlign.start,
                        publish.name,
                        maxLines: 2,
                        style: textHeader,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: Text(
                        textAlign: TextAlign.start,
                        publish.siteDescription,
                        maxLines: 2,
                        style: textBody,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
