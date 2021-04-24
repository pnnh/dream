import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suji/editor/editor.dart';

class SFXApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由切换示例',
      debugShowCheckedModeBanner: false,
      home: SFEditorRoute(),
    );
  }
}
