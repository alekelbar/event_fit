import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mapa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};
  String _evento = '';
  String _nombre = ''; //meter en base de datos
  String _horaSalida = '';
  String _tiempoEstimado = '';

  void _onMapTapped(LatLng location) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Nuevo market'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Evento'),
                onChanged: (value) => _evento = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Nombre'),
                onChanged: (value) => _nombre = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Hora de salida'),
                onChanged: (value) => _horaSalida = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Tiempo estimado'),
                onChanged: (value) => _tiempoEstimado = value,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancelar'),
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
                          child: Text(
                            '$_nombre\n$_evento\nSalida: $_horaSalida\nTiempo estimado: $_tiempoEstimado',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          padding: EdgeInsets.all(16.0),
                        ),
                      );
                    },
                  ),
                );
              });
              Navigator.of(context).pop();
            },
            child: Text('Agregar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(8.648997, -82.9436183),
          zoom: 13,
        ),
        markers: _markers,
        onTap: _onMapTapped,
      ),
    );
  }
}
