import 'dart:async';
import 'dart:html';

import 'package:flutter/cupertino.dart';
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
      case 'initPlugin':
        return initPlugin(call);
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'pillow for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  Future<String> getPlatformVersion() {
    final version = window.navigator.userAgent;
    return Future.value(version);
  }

  String initPlugin(MethodCall call) {
    String resUrl = call.arguments != null ? call.arguments["resUrl"] : "";
    debugPrint("arguments: $resUrl ${call.arguments}");

    document.head!.append(ScriptElement()
      ..src = resUrl
      ..type = 'module'
      ..defer = false);

    return "";
  }
}
