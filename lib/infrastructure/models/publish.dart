import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Publish {
  final String userId;
  final String title;
  final String siteDescription;
  final String imageUrl;
  final LatLng? pointOne;
  final LatLng? pointTwo;
  final int like;

  Publish({
    required this.userId,
    required this.title,
    required this.siteDescription,
    required this.imageUrl,
    required this.like,
    this.pointOne,
    this.pointTwo,
  });

  Map<String, dynamic> getMapper() {
    return {
      "userId": userId,
      "title": title,
      "siteDescription": siteDescription,
      "imageUrl": imageUrl,
      "pointOne": pointOne != null ? _geoPointFromLatLng(pointOne!) : null,
      "pointTwo": pointTwo != null ? _geoPointFromLatLng(pointTwo!) : null,
      "like": like,
    };
  }

  static LatLng? _latLngFromGeoPoint(GeoPoint? geoPoint) {
    if (geoPoint != null) {
      return LatLng(geoPoint.latitude, geoPoint.longitude);
    }
    return null;
  }

  static GeoPoint? _geoPointFromLatLng(LatLng? latLng) {
    if (latLng != null) {
      return GeoPoint(latLng.latitude, latLng.longitude);
    }
    return null;
  }
}
