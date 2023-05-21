import 'package:flutter/material.dart';

class PublishText extends StatelessWidget {
  const PublishText({
    required this.name,
    required this.description,
    super.key,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textHeader = Theme.of(context).textTheme.headlineSmall;
    final textBody = Theme.of(context).textTheme.bodyLarge;

    return Positioned(
      bottom: 20,
      left: 10,
      child: Column(
        children: [
          SizedBox(
            width: size.width * 0.7,
            child: Text(
              name,
              textAlign: TextAlign.start,
              maxLines: 2,
              style: textHeader,
            ),
          ),
          SizedBox(
            width: size.width * 0.7,
            child: Text(
              description,
              textAlign: TextAlign.start,
              maxLines: 2,
              style: textBody,
            ),
          ),
        ],
      ),
    );
  }
}
