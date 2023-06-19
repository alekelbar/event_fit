import 'package:event_fit/config/theme/config_theme.dart';
import 'package:event_fit/domain/utils/permission/get_message_permision_state.dart';
import 'package:event_fit/presentation/routes/routes.dart';
import 'package:event_fit/presentation/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/Firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Agrega esta línea
  await permissionSms();
  await permissionLocation();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// This void asks the user to accept the permissions to send sms.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).theme(),
      routes: routes,
      initialRoute: RoutesNames.info,
    );
  }
}
