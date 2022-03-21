import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/services/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TodoItemWidget extends StatefulWidget {
  final Task task;
  final TextEditingController controller;

  const TodoItemWidget({Key? key, required this.task, required this.controller})
      : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidget();
}

class _TodoItemWidget extends State<TodoItemWidget> {
  String content = "啊啊啊啊啊啊";
  final Color hoveredColor = const Color.fromRGBO(248, 249, 255, 100);

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<HomeProvider>(context);
    print("item build ${todoList.selectedKey} ${widget.task.key}");
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(4),
        border: InputBorder.none,
        filled: true,
        fillColor: todoList.selectedKey == widget.task.key
            ? const Color.fromRGBO(238, 243, 254, 100)
            : Colors.white,
        hoverColor: const Color.fromRGBO(238, 243, 254, 100),
      ),
      controller: widget.controller,
      onTap: () {
        print("item tap ${widget.task.key}");
        todoList.selectedKey = widget.task.key;
      },
      onChanged: (text) {
        print('First text field: ${widget.task.key} $text');
        todoList.putItem(widget.task.key, text);
      },
    );
  }
}
