import 'dart:async';

import 'package:flutter/services.dart';

class Pillow {
  static const MethodChannel _channel = MethodChannel('pillow');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> randomString() async {
    final String version = await _channel.invokeMethod('randomString');
    return version;
  }

  static String testMarkdown() {
    //runMarkdown();
    return "";
  }
}
