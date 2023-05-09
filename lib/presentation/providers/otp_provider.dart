import 'package:event_fit/domain/utils/otp/generate_otp.dart';
import 'package:event_fit/domain/utils/otp/send_sms.dart';
import 'package:flutter/material.dart';

class OptProviderController extends ChangeNotifier {
  String phoneNumber = "";
  bool isActivePhoneField = true;
  String actualOtp = "";
  List<String> digits = [];

  void addDigit(String value) => digits.add(value);

  bool validateDigits() {
    if (digits.length != 4 || actualOtp.length != 4 || phoneNumber.isEmpty) {
      return false;
    }

    final String otp = digits.join();
    return actualOtp == otp;
  }

  void resetState() {
    phoneNumber = "";
    isActivePhoneField = true;
    actualOtp = "";
    digits = [];
  }

  void reTry() {
    isActivePhoneField = true;
    notifyListeners();
  }

  void reSend() {
    if (phoneNumber.isNotEmpty) {
      sendMessage();
    }
  }

  void sendMessage() async {
    actualOtp = generateOTP();
    if (phoneNumber.isNotEmpty) {
      isActivePhoneField = !(await sendSMS(actualOtp, phoneNumber));
    }
    isActivePhoneField = false;
    notifyListeners();
  }
}
