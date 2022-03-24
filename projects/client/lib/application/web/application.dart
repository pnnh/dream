import 'package:flutter/material.dart';
import 'package:dream/application/web/pages/home.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网页应用',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePageWidget()),
    );
  }
}

Future<void> initApp() async {}
