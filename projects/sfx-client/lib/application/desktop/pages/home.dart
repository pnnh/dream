import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Row(children: [
          Container(width: 56, color: Color.fromRGBO(242, 246, 255, 100)),
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
              ))))
        ]));
  }
}
