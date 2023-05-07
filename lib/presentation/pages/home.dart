import 'package:event_fit/presentation/pages/Auth/sing_in.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: SingInScreen());
  }
}
