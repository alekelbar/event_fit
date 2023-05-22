import 'package:event_fit/presentation/pages/Auth/register_screen.dart';
import 'package:event_fit/presentation/pages/Auth/login_screen.dart';
import 'package:event_fit/presentation/pages/googleMaps/map.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:event_fit/presentation/routes/routes_names.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  RoutesNames.homePage: (context) => const Homescreen(),
  RoutesNames.loginPage: (context) => const LoginScreen(),
  RoutesNames.registerPage: (context) => const RegisterScreen(),
  RoutesNames.mapPage: (context) => const MapScreen(),
};
