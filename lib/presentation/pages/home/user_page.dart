import 'package:event_fit/presentation/pages/googleMaps/map.dart';
import 'package:event_fit/presentation/pages/home/publish_wall.dart';
import 'package:event_fit/presentation/pages/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    PublishWall(),
    const MapScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(Icons.logout),
      //     onPressed: () async {
      //       bool exit = await onExit();
      //       if (exit) {
      //         await FirebaseAuth.instance.signOut();
      //         setState(() {});
      //       }
      //     },
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(
              icon: Icon(Icons.gps_fixed), label: "Eventos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_outlined), label: "Perfil")
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}
