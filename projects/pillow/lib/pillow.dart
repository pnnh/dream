import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pillow/markdown/markdown.dart';

class Pillow {
  static const MethodChannel _channel = MethodChannel('pillow');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static String testMarkdown() {
    runMarkdown();
    return "";
  }
}
