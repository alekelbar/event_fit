import 'package:event_fit/infrastructure/models/publish.dart';
import 'package:flutter/material.dart';

class PublishCard extends StatelessWidget {
  const PublishCard({
    super.key,
    required this.publish,
    required this.size,
  });

  final Publish publish;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    publish.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              publish.siteDescription,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Image.network(
              publish.imageUrl,
              width: size.width,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.people)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.place)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
