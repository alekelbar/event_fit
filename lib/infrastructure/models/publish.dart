import 'package:google_maps_flutter/google_maps_flutter.dart';

class Publish {
  final String id;
  final String userId;
  final String title;
  final String siteDescription;
  final String imageUrl;
  final Type type; // casting for class base
  final int like;

  Publish(
      {required this.userId,
      required this.id,
      required this.title,
      required this.siteDescription,
      required this.imageUrl,
      required this.type,
      required this.like});
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
