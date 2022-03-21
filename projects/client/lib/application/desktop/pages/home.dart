import 'package:dream/application/desktop/provider/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/filter_group.dart';
import '../components/todo_list.dart';
import '../components/work_body.dart';
import '../components/work_group.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: Container(
            color: Colors.white,
            child: Row(children: [
              Container(
                  width: 56,
                  padding: const EdgeInsets.only(top: 8),
                  color: const Color.fromRGBO(242, 246, 255, 100),
                  child: const WorkGroupWidget()),
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
              ])));
  }
}
