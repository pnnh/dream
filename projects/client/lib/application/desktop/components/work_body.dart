import 'package:dream/services/models/task.dart';
import 'package:flutter/material.dart';

class WorkBodyWidget extends StatefulWidget {
  final Task? task;
  const WorkBodyWidget({Key? key, this.task}) : super(key: key);

  @override
  State<WorkBodyWidget> createState() => _WorkBodyWidget();
}

class _WorkBodyWidget extends State<WorkBodyWidget> {
  int selectedIndex = 0;
  final Color selectedColor = const Color.fromRGBO(0, 119, 212, 100);
  final Color defaultColor = const Color.fromRGBO(146, 148, 152, 100);
  final titleController = TextEditingController(text: "啊啊啊啊啊啊");
  final bodyController = TextEditingController(text: "body");

  @override
  Widget build(BuildContext context) {
    if (widget.task == null) {
      return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image(image: AssetImage('images/ui/empty.png')),
        Text("点击左侧标题查看详情",
        style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        ),)]
      ));
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
          controller: titleController,
          onTap: () {
          },
          onChanged: (text) {
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
          controller: bodyController,
          onTap: () {
          },
          onChanged: (text) {
          },
        )
      ])
    );
  }
}
