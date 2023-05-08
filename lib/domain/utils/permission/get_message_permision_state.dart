import 'package:permission_handler/permission_handler.dart';

Future<bool> getMessagePermission() async {
  PermissionStatus messagePermission = await Permission.sms.status;

  if (messagePermission == PermissionStatus.granted) return true;

  final Map<Permission, PermissionStatus> permissionStatuses = await [
    Permission.sms,
    Permission.storage,
  ].request();

  return permissionStatuses[Permission.sms] != PermissionStatus.granted;
}
