import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({settings, builder}) : super(settings: settings, builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}


class BookRoutePath {
  final int id;

  BookRoutePath.home() : id = 0;

  BookRoutePath.details(this.id);

  bool get isHomePage => id == 0;

  bool get isDetailsPage => id != 0;
}

