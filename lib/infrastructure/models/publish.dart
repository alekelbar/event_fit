import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Publish {
  final String id;
  final String userId;
  final String title;
  final String siteDescription;
  final String imageUrl;
  final LatLng? pointOne;
  final LatLng? pointTwo;
  final int like;

  Publish({
    required this.id,
    required this.userId,
    required this.title,
    required this.siteDescription,
    required this.imageUrl,
    required this.like,
    this.pointOne,
    this.pointTwo,
  });

  Publish.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        siteDescription = json['siteDescription'],
        imageUrl = json['imageUrl'],
        like = json['like'],
        pointOne = Publish._latLngFromGeoPoint(json['pointOne']),
        pointTwo = Publish._latLngFromGeoPoint(json['pointTwo']);

  Publish copyWith({
    String? id,
    String? userId,
    String? title,
    String? siteDescription,
    String? imageUrl,
    LatLng? pointOne,
    LatLng? pointTwo,
    int? like,
  }) {
    return Publish(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      siteDescription: siteDescription ?? this.siteDescription,
      imageUrl: imageUrl ?? this.imageUrl,
      pointOne: pointOne ?? this.pointOne,
      pointTwo: pointTwo ?? this.pointTwo,
      like: like ?? this.like,
    );
  }

  Map<String, dynamic> getMapper() {
    return {
      "id": id,
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
