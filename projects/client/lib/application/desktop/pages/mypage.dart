import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/pages/calendar.dart';
import 'package:dream/application/desktop/pages/home.dart';
import 'package:dream/application/desktop/route.dart';
import 'package:flutter/material.dart';

class MyPage extends Page {
  final BookRoutePath routePath;

  MyPage(
    this.routePath,
  ) : super(key: ValueKey(routePath));

  @override
  Route createRoute(BuildContext context) {
    return CustomPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return Scaffold(
          body: WindowBorder(
              color: Color(0xFF805306),
              width: 1,
              child: routePath.pathName == Pages.home
                  ? HomePage()
                  : CalendarPage()),
        );
      },
    );
  }
}
