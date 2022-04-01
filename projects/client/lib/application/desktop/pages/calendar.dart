import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/components/window.dart';
import 'package:flutter/material.dart';

import '../components/work_group.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                height: 40,
                color: Color.fromRGBO(231, 231, 231, 100),
                child: WindowTitleBarBox(
                    child: Row(children: [
                  Expanded(
                      child: MoveWindow(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("筑梦笔记")]))),
                  WindowButtons() // 似乎在macOS下不太需要
                ]))),
            Expanded(
                child: Row(children: [
              Container(
                  width: 56,
                  padding: const EdgeInsets.only(top: 8),
                  color: const Color.fromRGBO(242, 246, 255, 100),
                  child: const WorkGroupWidget()),
              Container(child: Text("哈哈哈 日历页面"))
            ]))
          ],
        ));
  }
}
