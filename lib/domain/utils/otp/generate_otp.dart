import 'dart:math';

//generates a 6-digit random number that will function as the otp
String generateOTP() {
  var random = Random();
  String otp = '';
  for (var i = 0; i < 4; i++) {
    otp += random.nextInt(9).toString();
  }
  return otp;
}
