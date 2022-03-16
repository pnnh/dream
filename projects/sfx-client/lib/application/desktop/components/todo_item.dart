import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list.dart';

class TodoItemWidget extends StatefulWidget {
  final int id;
  final TextEditingController controller;

  const TodoItemWidget({Key? key, required this.id, required this.controller})
      : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidget();
}

class _TodoItemWidget extends State<TodoItemWidget> {
  String content = "啊啊啊啊啊啊";
  final Color hoveredColor = const Color.fromRGBO(248, 249, 255, 100);

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<TodoListModel>(context);
    print("item build ${todoList.selectedIndex} ${widget.id}");
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(4),
        border: InputBorder.none,
        filled: true,
        fillColor: todoList.selectedIndex == widget.id
            ? const Color.fromRGBO(238, 243, 254, 100)
            : Colors.white,
        hoverColor: const Color.fromRGBO(238, 243, 254, 100),
      ),
      controller: widget.controller,
      onTap: () {
        print("item tap ${widget.id}");
        todoList.selectedIndex = widget.id;
      },
    );
  }
}
