import 'package:flutter/material.dart';

class PublishButtons extends StatelessWidget {
  const PublishButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 20,
      right: 10,
      child: Column(
        children: [
          _CustomIconButton(
            icon: Icons.favorite,
            colorData: Colors.red,
          ),
          SizedBox(
            height: 25,
          ),
          _CustomIconButton(
            icon: Icons.gps_fixed,
          ),
          SizedBox(
            height: 25,
          ),
          _CustomIconButton(
            icon: Icons.people,
          ),
        ],
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;

  const _CustomIconButton({
    required this.icon,
    colorData,
  }) : color = colorData ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        size: 30,
        icon,
        color: color,
      ),
    );
  }
}
