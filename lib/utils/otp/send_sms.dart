
import 'package:direct_sms/direct_sms.dart';


//In message goes the generateOTP() function.
//remember to save the opt in some public string, so that later You can make the comparison of whether it is correct or not.
//number is the user's phone number.
Future<void> sendSMS(String message, String number) async {

  //Send text message 
  try {
    await DirectSms().sendSms(phone: number, message: message);
  } catch (e) {
    throw Exception('Error al enviar SMS: ${e.toString()}');
  }
} 
