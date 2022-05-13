import 'dart:async';
// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:pillow/web/random.dart';

/// A web implementation of the Pillow plugin.
class PillowWeb {
  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'pillow',
      const StandardMethodCodec(),
      registrar,
    );

    final pluginInstance = PillowWeb();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'getPlatformVersion':
        return getPlatformVersion();
      case 'randomString':
        return randomString(16, true, true, true, true);
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'pillow for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  Future<String> getPlatformVersion() {
    final version = html.window.navigator.userAgent;
    return Future.value(version);
  }
}
