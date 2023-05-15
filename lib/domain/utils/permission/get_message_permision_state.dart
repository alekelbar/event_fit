import 'package:permission_handler/permission_handler.dart';

//If the user dont accept the sms permission, next time you use this void, it gonna request again
Future<void> permissionSms() async {
  // Request the necessary permissions for send sms
  Map<Permission, PermissionStatus> statuses = await [
    Permission.sms
  ].request();
  // Check if the necessary permits have been issued
  if (statuses[Permission.sms] != PermissionStatus.granted) {
    throw Exception('Los permisos necesarios no fueron concedidos');
  }
}

//If the user dont accept the location permission, next time you use this void, it gonna request again.
Future<void> permissionLocation() async {
  // Request the necessary permissionsn for use the location
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
  ].request();

  // Check if the necessary permits have been issued
  if (statuses[Permission.location] != PermissionStatus.granted) {
    throw Exception('Los permisos necesarios no fueron concedidos');
  }
}
