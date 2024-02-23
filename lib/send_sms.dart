import 'package:flutter/services.dart';

class SmsSender {
  static const MethodChannel _channel = MethodChannel('sms_sender_channel');

  static Future<String> sendSms(String number, String message) async {
    try {
      final String result = await _channel.invokeMethod('sendSms', {"number": number, "message": message});
      return result;
    } on PlatformException catch (e) {
      return 'Failed to send SMS: ${e.message}';
    }
  }
}
