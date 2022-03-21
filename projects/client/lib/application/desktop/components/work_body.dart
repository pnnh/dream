import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/services/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkBodyWidget extends StatefulWidget {
  const WorkBodyWidget({Key? key }) : super(key: key);

  @override
  State<WorkBodyWidget> createState() => _WorkBodyWidget();
}

class _WorkBodyWidget extends State<WorkBodyWidget> {
  int selectedIndex = 0;
  final Color selectedColor = const Color.fromRGBO(0, 119, 212, 100);
  final Color defaultColor = const Color.fromRGBO(146, 148, 152, 100);
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<HomeProvider>(context);
    if (todoList.selectedTask == null) {
      return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Image(image: AssetImage('images/ui/empty.png')),
        Text("点击左侧标题查看详情",
        style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        ),)]
      ));
    }
    titleController.text = todoList.selectedTask?.name ?? "默认标题";
    bodyController.text = todoList.selectedTask?.name ?? "默认正文";
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
          controller: bodyController,
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
