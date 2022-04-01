import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/pages/calendar.dart';
import 'package:dream/application/desktop/pages/home.dart';
import 'package:dream/application/desktop/route.dart';
import 'package:flutter/material.dart';

import 'other.dart';

class MyPage extends Page {
  final BookRoutePath routePath;

  MyPage(
    this.routePath,
  ) : super(name: routePath.uri.toString(), key: ValueKey(routePath));

  @override
  Route createRoute(BuildContext context) {
    return CustomPageRoute(
      (BuildContext context) {
        print("createRoute ${routePath.uri}");
        return Scaffold(
          body: WindowBorder(
              color: Color(0xFF805306),
              width: 1,
              child: selectPage(routePath.uri)),
        );
      },
      settings: this,
    );
  }
}

Widget selectPage(Uri uri) {
  print("uri_path ${uri.path}");
  switch (uri.path) {
    case "/calendar":
      return CalendarPage();
    case "/other":
      return OtherPage();
    default:
      return HomePage();
  }
}
