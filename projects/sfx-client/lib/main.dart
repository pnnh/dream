import 'package:flutter/material.dart';

import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sfxui/application/desktop/application.dart';
import 'package:sfxui/application/web/application.dart';

void main() {
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

  if (kIsWeb) {
    runApp(WebApplication());
  } else {
    runApp(DesktopApplication());
  }
}
