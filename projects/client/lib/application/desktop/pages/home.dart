import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/components/window.dart';
import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/application/desktop/provider/todo.dart';
import 'package:dream/application/desktop/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/filter_group.dart';
import '../components/todo_list.dart';
import '../components/work_group.dart';

class HomePage extends Page {
  HomePage() : super(key: ValueKey(""));

  Route createRoute(BuildContext context) {
    return CustomPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => TodoProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => HomeProvider(),
              )
            ],
            child: Scaffold(
              body: WindowBorder(
                  color: Color(0xFF805306), width: 1, child: HomeScreen()),
            ));
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
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
                child: GestureDetector(
                    onTapDown: (detail) {
                      print("out click");
                      homeProvider.closeDatePicker();
                    },
                    child: Row(children: [
                      Container(
                          width: 56,
                          padding: const EdgeInsets.only(top: 8),
                          color: const Color.fromRGBO(242, 246, 255, 100),
                          child: const WorkGroupWidget()),
                      if (homeProvider.showFilter)
                        Container(
                            width: 240,
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              color: Color.fromRGBO(229, 229, 229, 100),
                              width: 1,
                            ))),
                            child: const FilterGroupWidget()),
                      const TodoListWidget(),
                    ])))
          ],
        ));
  }
}
