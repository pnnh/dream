import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:sfxui/application/web/pages/home.dart';

class WebApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(js.context.callMethod("sayHello"));
    return MaterialApp(
      title: '网页应用',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePageWidget()),
    );
  }
}
