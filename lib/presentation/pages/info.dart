import 'package:event_fit/presentation/pages/home.dart';
import 'package:event_fit/presentation/routes/routes.dart';
import 'package:event_fit/presentation/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final List<String> titles = [
    'Bienvenido',
    'Descubre',
    'Disfruta',
  ];

  final List<String> descriptions = [
    '¡Bienvenido a nuestra aplicación!',
    'Descubre nuevas funcionalidades',
    'Disfruta de una experiencia increíble',
  ];

  final List<String> images = [
    'assets/img/image1.jpg',
    'assets/img/image2.jpg',
    'assets/img/image3.jpg',
  ];

  Future<bool> _getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') == null ? true : false;
  }

  Future<void> _setIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getIsFirstTime(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData && snapshot.data == false) {
          return const Homescreen();
        } else {
          // Show introduction screen
          return Scaffold(
            body: PageView.builder(
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index],
                        height: 450,
                      ),
                      const SizedBox(height: 32.0),
                      Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        descriptions[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                _setIsFirstTime();
                Navigator.pushReplacementNamed(context, RoutesNames.homePage);
              },
              child: const Icon(Icons.arrow_forward),
            ),
          );
        }
      },
    );
  }
}
