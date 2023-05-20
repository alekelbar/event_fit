import 'package:event_fit/presentation/pages/Auth/sign_up.dart';
import 'package:event_fit/presentation/pages/Auth/sing_in.dart';
import 'package:event_fit/presentation/pages/googleMaps/map.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:event_fit/presentation/routes/routes_names.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  RoutesNames.homePage: (context) => const Homescreen(),
  RoutesNames.loginPage: (context) => const SingInScreen(),
  RoutesNames.registerPage: (context) => const SingUpScreen(),
  RoutesNames.mapPage: (context) => const MapScreen(),
};