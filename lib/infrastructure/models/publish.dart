import 'package:google_maps_flutter/google_maps_flutter.dart';

class Publish {
  final String id;
  final String name;
  final String siteDescription;
  final String imageUrl;
  final Type type; // casting for class base

  Publish(
      {required this.id,
      required this.name,
      required this.siteDescription,
      required this.imageUrl,
      required this.type});
}

// base for use a type
abstract class Type {}

class DynamicEvent extends Type {
  final LatLng pointOne;
  final LatLng pointTwo;

  DynamicEvent({
    required this.pointOne,
    required this.pointTwo,
  });
}

class SimpleEvent extends Type {
  final LatLng pointOne;

  SimpleEvent({
    required this.pointOne,
  });
}
