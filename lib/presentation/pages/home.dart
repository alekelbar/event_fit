import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Set<Marker> _markers = {};

  String _evento = '';
  String _nombre = ''; //meter en base de datos
  String _horaSalida = '';
  String _tiempoEstimado = '';

  void _onMapTapped(LatLng location) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nuevo market'),
        content: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Evento'),
                    onChanged: (value) => _evento = value,
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    onChanged: (value) => _nombre = value,
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Hora de salida'),
                    onChanged: (value) => _horaSalida = value,
                    style: Theme.of(context).textTheme.bodySmall,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Tiempo estimado'),
                    onChanged: (value) => _tiempoEstimado = value,
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
                      title: _nombre,
                      snippet:
                          '$_evento\nSalida: $_horaSalida\nTiempo estimado: $_tiempoEstimado',
                    ),
                    onTap: () {
                      // Mostrar contenido de ventana de información al tocar la marca
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            '$_nombre\n$_evento\nSalida: $_horaSalida\nTiempo estimado: $_tiempoEstimado',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(8.648997, -82.9436183),
          zoom: 13,
        ),
        markers: _markers,
        onTap: _onMapTapped,
      ),
    );
  }
}
