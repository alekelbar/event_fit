import 'package:event_fit/config/theme/config_theme.dart';
import 'package:event_fit/presentation/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Agrega esta línea
  await permissionVerification(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

// This void asks the user to accept the permissions to send sms.
Future<void> permissionVerification() async {
  // Request the necessary permissions
  Map<Permission, PermissionStatus> statuses = await [
    Permission.sms,
    Permission.phone,
  ].request();

  // Check if the necessary permits have been issued
  if (statuses[Permission.sms] != PermissionStatus.granted ||
      statuses[Permission.phone] != PermissionStatus.granted) {
    throw Exception('Los permisos necesarios no fueron concedidos');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).theme(),
      home: const MyHomePage(title: 'EventFit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Homescreen(),
      ),
    );
  }
}
