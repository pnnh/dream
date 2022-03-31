import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/components/window.dart';
import 'package:dream/application/desktop/provider/todo.dart';
import 'package:dream/services/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

class TitleBarWidget extends StatefulWidget {
  const TitleBarWidget({Key? key}) : super(key: key);

  @override
  State<TitleBarWidget> createState() => _TitleBarWidget();
}

class _TitleBarWidget extends State<TitleBarWidget> {
  String content = "搜索笔记";
  final hoverColor = const Color.fromRGBO(204, 204, 204, 100);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        color: Color.fromRGBO(231, 231, 231, 100),
        child: WindowTitleBarBox(
            child: Row(children: [
          Expanded(
              child: MoveWindow(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                //if (Platform.isMacOS) SizedBox(width: 5),
                Container(
                    padding: EdgeInsets.only(left: Platform.isMacOS ? 74 : 0),
                    //width: 120,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                              child: SvgPicture.asset(
                                "images/svg/arrow_left_s.svg",
                              ),
                              style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(2)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(24, 24)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                overlayColor:
                                    MaterialStateProperty.all(hoverColor),
                              ),
                              onPressed: () {}),
                          SizedBox(width: 4),
                          TextButton(
                              child: SvgPicture.asset(
                                "images/svg/arrow_right_s.svg",
                              ),
                              style: ButtonStyle(
                                minimumSize:
                                    MaterialStateProperty.all(Size.zero),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(2)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(24, 24)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                overlayColor:
                                    MaterialStateProperty.all(hoverColor),
                              ),
                              onPressed: () {}),
                        ])),
                Container(
                  child: Text("筑梦笔记"),
                ),
                Container(
                    width: 120,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: '搜索笔记',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                      controller: TextEditingController(text: ""),
                    ))
              ]))),
          WindowButtons() // 似乎在macOS下不太需要
        ])));
  }
}
