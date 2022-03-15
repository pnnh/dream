import 'package:flutter/material.dart';

import '../components/avatar.dart';
import '../components/booklet.dart';
import '../components/calendar.dart';
import '../components/todo.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(children: [
          Container(
              width: 56,
              padding: EdgeInsets.only(top: 8),
              color: Color.fromRGBO(242, 246, 255, 100),
              child: Column(children: [
                AvatarWidget(),
                SizedBox(height: 24),
                TodoWidget(),
                SizedBox(height: 24),
                BookletWidget(),
                SizedBox(height: 24),
                CalendarWidget()
              ])),
          Container(
              width: 240,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                color: Color.fromRGBO(229, 229, 229, 100),
                width: 1,
              )))),
          Container(
              width: 380,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                color: Color.fromRGBO(229, 229, 229, 100),
                width: 1,
              )))),
          Container(
            color: Colors.white,
          )
        ]));
  }
}
