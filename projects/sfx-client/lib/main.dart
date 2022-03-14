import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:sfxui/application/desktop/application.dart'
    if (dart.library.html) 'package:sfxui/application/web/application.dart'
    as application;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var platformName = '';
  if (kIsWeb) {
    platformName = "Web";
  } else {
    if (Platform.isAndroid) {
      platformName = "Android";
    } else if (Platform.isIOS) {
      platformName = "IOS";
    } else if (Platform.isFuchsia) {
      platformName = "Fuchsia";
    } else if (Platform.isLinux) {
      platformName = "Linux";
    } else if (Platform.isMacOS) {
      platformName = "MacOS";
    } else if (Platform.isWindows) {
      platformName = "Windows";
    }
  }
  print("platformName :- " + platformName.toString());

  await application.initApp();
  runApp(application.Application());
}
