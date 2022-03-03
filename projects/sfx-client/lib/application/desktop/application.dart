import 'package:flutter/material.dart';
import 'package:sfxui/editor/editor.dart';

class DesktopApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '桌面应用',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('SFXAPP'),
        ),
        body: SafeArea(
          child: SFEditorRoute(),
        ),
      ),
    );
  }
}