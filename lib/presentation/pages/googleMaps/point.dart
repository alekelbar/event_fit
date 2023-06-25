import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:event_fit/presentation/pages/googleMaps/controllers/map_controller.dart';
import './map.dart';

class StepperExampleApp extends StatelessWidget {
  const StepperExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade500, Colors.green.shade300],
          ),
        ),
        child: const StepperExample(),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({Key? key}) : super(key: key);

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;
  final MapController _controller = MapController();
  final Set<Marker> _markers = {};
  bool isHybrid = false;
  String _eventName = '';
  String _eventDescription = '';
  String _imageUrl = '';
  String _startTime = '';
  String _duration = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 226, 69, 69),
      body: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index == 0) {
              // Regresar a la página principal (map)
              Navigator.pop(context);
            } else if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index < 2) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text('DATOS'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nombre del evento',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _eventName = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Descripción del evento',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _eventDescription = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'URL de la imagen',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _imageUrl = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Hora de salida',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _startTime = value;
                      });
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Duración estimada',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _duration = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Step(
              title: const Text('DEPORTE'),
              content: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte del fútbol
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.sports_soccer,
                            ),
                            Text(
                              'FUTBOL',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte del baloncesto
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.sports_basketball,
                            ),
                            Text(
                              'BALONCESTO',
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte del tenis
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.sports_tennis,
                            ),
                            Text(
                              'TENNIS',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte del ciclismo
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.directions_bike,
                            ),
                            Text(
                              'CICLISMO',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte de correr
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.directions_run,
                            ),
                            Text(
                              'CORRER',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte de natación
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.waves,
                            ),
                            Text(
                              'NATACION',
                              style: TextStyle(
                                fontSize: 6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte de senderismo
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.hiking_rounded,
                            ),
                            Text(
                              'SENDERISMO',
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte del gimnasio
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.fitness_center,
                            ),
                            Text(
                              'GIMNASIO',
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Lógica para seleccionar el deporte de kayak
                        },
                        icon: const Column(
                          children: [
                            Icon(
                              Icons.kayaking,
                            ),
                            Text(
                              'KAYAK',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Agrega más IconButton según sea necesario
                ],
              ),
            ),
            Step(
              title: const Text('MAPA'),
              content: SizedBox(
                height: 300,
                child: Stack(
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
              ),
            ),
          ]),
    );
  }
}
