import 'package:flutter/material.dart';

class PublishCover extends StatelessWidget {
  const PublishCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.lightBlue,
          ],
          stops: [0.8, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
      ),
    );
  }
}
