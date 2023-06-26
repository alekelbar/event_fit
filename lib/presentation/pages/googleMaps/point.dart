import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:event_fit/presentation/pages/googleMaps/controllers/map_controller.dart';

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
  String _selectedSport = '';
  bool _isDataComplete = false;
  bool _isSportComplete = false;

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
        onStepContinue: _isDataComplete && (_isSportComplete || _index < 1)
            ? () {
                if (_index < 2) {
                  setState(() {
                    _index += 1;
                  });
                }
              }
            : null,
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
                      _isDataComplete = _checkDataComplete();
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
                      _isDataComplete = _checkDataComplete();
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
                      _isDataComplete = _checkDataComplete();
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
                      _isDataComplete = _checkDataComplete();
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
                      _isDataComplete = _checkDataComplete();
                    });
                  },
                ),
              ],
            ),
          ),
          Step(
            title: const Text('DEPORTE'),
            content: Row(
              children: [
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: [
                      IconButton(
                        onPressed: () {
                          _selectSport('FÚTBOL');
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.sports_soccer,
                              color: _selectedSport == 'FÚTBOL'
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const Text(
                              'FÚTBOL',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _selectSport('BALONCESTO');
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.sports_basketball,
                              color: _selectedSport == 'BALONCESTO'
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const Text(
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
                          _selectSport('Tenis');
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.sports_tennis,
                              color: _selectedSport == 'Tenis'
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const Text(
                              'Tenis',
                              style: TextStyle(
                                fontSize: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: [
                      IconButton(
                        onPressed: () {
                          _selectSport('Correr');
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.run_circle_outlined,
                              color: _selectedSport == 'Correr'
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const Text(
                              'Correr',
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _selectSport('Zumba');
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.sports_gymnastics_sharp,
                              color: _selectedSport == 'Zumba'
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const Text(
                              'Zumba',
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _selectSport('Voleibol');
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.sports_volleyball_sharp,
                              color: _selectedSport == 'Voleibol'
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                            const Text(
                              'Voleibol',
                              style: TextStyle(
                                fontSize: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
        ],
      ),
    );
  }

  void _selectSport(String sport) {
    setState(() {
      _selectedSport = sport;
      _isSportComplete = sport.isNotEmpty;
    });
  }

  bool _checkDataComplete() {
    return _eventName.isNotEmpty &&
        _eventDescription.isNotEmpty &&
        _imageUrl.isNotEmpty &&
        _startTime.isNotEmpty &&
        _duration.isNotEmpty;
  }
}

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

void main() {
  runApp(const MaterialApp(
    home: StepperExampleApp(),
  ));
}
