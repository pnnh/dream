import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({settings, builder})
      : super(settings: settings, builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

enum Pages { home, detail, other }

class BookRoutePath {
  Pages pathName = Pages.home;

  BookRoutePath.home();
  BookRoutePath.details() : pathName = Pages.detail;
}
