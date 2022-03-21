import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/services/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'empty.dart';

class WorkBodyWidget extends StatefulWidget {
  final TextEditingController? controller;
  const WorkBodyWidget({Key? key, required this.controller }) : super(key: key);

  @override
  State<WorkBodyWidget> createState() => _WorkBodyWidget();
}

class _WorkBodyWidget extends State<WorkBodyWidget> {
  final Color selectedColor = const Color.fromRGBO(0, 119, 212, 100);
  final Color defaultColor = const Color.fromRGBO(146, 148, 152, 100);

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<HomeProvider>(context);
    if (todoList.selectedTask == null) {
      return const EmptyWidget(message: "点击左侧标题查看详情");
    }
    if (widget.controller == null) {
      throw Exception("WorkBodyWidget找不到controller");
    }
    return Padding(
      padding: const EdgeInsets.all(16),
      child:Column(children: [
        TextField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(4),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
          ),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          controller: widget.controller,
          onChanged: (text) {
            var key = todoList.selectedTask?.key ?? "";
            if (key.isNotEmpty) {
              todoList.putItem(key, text);
            }
          },
        ),
        const SizedBox(height: 24),
        TextField(
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(4),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            hoverColor: Colors.white,
          ),
          controller: widget.controller,
          onChanged: (text) {
            var key = todoList.selectedTask?.key ?? "";
            if (key.isNotEmpty) {
              todoList.putItem(key, text);
            }
          },
        )

      ])
    );
  }
}
