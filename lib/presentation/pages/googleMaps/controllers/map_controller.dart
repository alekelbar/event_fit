import 'package:event_fit/domain/utils/GoogleMapAssets/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController {
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }
}
