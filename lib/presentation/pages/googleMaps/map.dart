import 'package:event_fit/presentation/pages/googleMaps/controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final MapController _controller = MapController();
  final Set<Marker> _markers = {};

  String _event = '';
  String _startsAt = '';
  String _duration = '';

  bool isHybrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
        leading: TextButton(
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(Size(70, 60)),
            ),
            child: const Icon(Icons.gps_fixed),
          ),
          const SizedBox(
            height: 20,
          ),
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
          )
        ],
      ),
      body: GoogleMap(
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: LatLng(8.648997, -82.9436183),
          zoom: 13,
        ),
        markers: _markers,
        onTap: _onMapTapped,
        zoomControlsEnabled: false,
        mapType: isHybrid ? MapType.hybrid : MapType.normal,
        compassEnabled: true,
      ),
    );
  }

  void _onMapTapped(LatLng location) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Crea un evento!'),
        content: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Evento'),
                    onChanged: (value) => _event = value,
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Hora de salida'),
                    onChanged: (value) => _startsAt = value,
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Tiempo estimado'),
                    onChanged: (value) => _duration = value,
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _markers.add(
                  Marker(
                    markerId: MarkerId(location.toString()),
                    position: location,
                    infoWindow: InfoWindow(
                      title: _event,
                      snippet:
                          '$_event\nSalida: $_startsAt\nTiempo estimado: $_duration',
                    ),
                    onTap: () {
                      // Mostrar contenido de ventana de información al tocar la marca
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '$_event\n$_event\nSalida: $_startsAt\nTiempo estimado: $_duration',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    },
                  ),
                );
              });
              Navigator.of(context).pop();
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }
}
