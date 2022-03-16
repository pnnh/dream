import 'package:flutter/material.dart';

class TodoItemWidget extends StatefulWidget {
  final String content2;
  final bool selected;

  const TodoItemWidget(
      {Key? key, this.content2 = "啊啊啊啊", this.selected = false})
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
    return MouseRegion(
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(4),
            border: InputBorder.none,
            filled: true,
            fillColor: widget.selected
                ? const Color.fromRGBO(238, 243, 254, 100)
                : Colors.white,
          ),
          controller: TextEditingController(text: widget.content2),
          onTap: () {},
        ),
        onHover: (value) {},
        onExit: (value) {});
  }
}
