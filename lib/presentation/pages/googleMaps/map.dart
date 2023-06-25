import 'package:event_fit/presentation/pages/googleMaps/controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './point.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final MapController _controller = MapController();
  final Set<Marker> _markers = {};

  bool isHybrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(70, 60)),
            ),
            onPressed: () {
              setState(() {
                isHybrid = !isHybrid;
              });
            },
            child: const Icon(Icons.map),
          ),
          const SizedBox(height: 16), // Espacio vertical entre los botones
          ElevatedButton(
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(70, 60)),
            ),
            onPressed: _onButtonPressed,
            child: const Icon(Icons.add_location_alt_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _controller.onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(8.648997, -82.9436183),
              zoom: 13,
            ),
            markers: _markers,
            zoomControlsEnabled: false,
            mapType: isHybrid ? MapType.hybrid : MapType.normal,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
          ),
        ],
      ),
    );
  }

  void _onButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const StepperExampleApp()),
    );
  }
}
