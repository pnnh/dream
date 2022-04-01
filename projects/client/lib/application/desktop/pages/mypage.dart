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
  ) : super(name: routePath.pathName.toString(), key: ValueKey(routePath));

  @override
  Route createRoute(BuildContext context) {
    return CustomPageRoute(
      (BuildContext context) {
        return Scaffold(
          body: WindowBorder(
              color: Color(0xFF805306),
              width: 1,
              child: selectPage(routePath.pathName)),
        );
      },
      settings: this,
    );
  }
}

Widget selectPage(Pages page) {
  switch (page) {
    case Pages.home:
      return HomePage();
    case Pages.detail:
      return CalendarPage();
    case Pages.other:
      return OtherPage();
  }
}
