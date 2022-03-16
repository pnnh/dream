import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_list.dart';

class TodoItemWidget extends StatefulWidget {
  final int id;
  final String content2;

  const TodoItemWidget({Key? key, required this.id, this.content2 = "啊啊啊啊"})
      : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidget();
}

class _TodoItemWidget extends State<TodoItemWidget> {
  int hoveredIndex = 0;
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
      controller: TextEditingController(text: widget.content2),
      onTap: () {
        print("item tap ${widget.id}");
        todoList.selectedIndex = widget.id;
      },
    );
  }
}
