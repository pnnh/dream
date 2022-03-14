import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:sfxui/application/desktop/pages/home.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '桌面应用',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: HomePageWidget(),
      ),
    );
  }
}

Future initApp() async {
  await DesktopWindow.setWindowSize(Size(1200, 900));
}
