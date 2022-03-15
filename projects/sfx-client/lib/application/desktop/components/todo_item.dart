import 'package:flutter/material.dart';

class TodoItemWidget extends StatefulWidget {
  String content2 = "哈哈哈";

  TodoItemWidget({Key? key, this.content2 = "啊啊啊啊"}) : super(key: key);

  @override
  State<TodoItemWidget> createState() => _TodoItemWidget();
}

class _TodoItemWidget extends State<TodoItemWidget> {
  int hoveredIndex = 0;
  String content = "啊啊啊啊啊啊";
  final Color hoveredColor = const Color.fromRGBO(248, 249, 255, 100);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(4),
            border: InputBorder.none,
            fillColor: Color.fromRGBO(238, 243, 254, 100),
          ),
          controller: TextEditingController(text: widget.content2),
          onTap: () {},
        ),
        onHover: (value) {},
        onExit: (value) {});
  }
}
