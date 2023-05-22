import 'package:flutter/material.dart';

class ToggleAuthOption extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const ToggleAuthOption({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      )
    ]);
  }
}
