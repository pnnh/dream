import 'package:dream/application/desktop/components/work_body.dart';
import 'package:dream/application/desktop/provider/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream/application/desktop/components/todo_item.dart';

import 'empty.dart';


class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidget();
}

class _TodoListWidget extends State<TodoListWidget> {
  final Color selectedColor = const Color.fromRGBO(238, 243, 254, 100);
  final Color defaultColor = Colors.white;
  final Color iconColor = const Color.fromRGBO(153, 153, 153, 100);
  final contentController = TextEditingController(text: "啊啊啊啊啊啊");
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final todoListModel = Provider.of<HomeProvider>(context);
    final currentController = todoListModel.controllers[todoListModel.selectedTask?.key];

    return Expanded(child: Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
              width: 380,
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(
                        color: Color.fromRGBO(229, 229, 229, 100),
                        width: 1,
                      ))),
              child: Column(
                children: [
                  SizedBox(
                      height: 48,
                      child: TextField(
                        autofocus: true,
                        focusNode: myFocusNode,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        keyboardType: TextInputType.number,
                        controller: contentController,
                        onSubmitted: (value) {
                          print("Go button is clicked $value");
                          todoListModel.addItem(value);
                          contentController.text = "";
                          myFocusNode.requestFocus();
                        },
                        onChanged: (text) {
                          print("onChanged $text");
                        },
                      )),
                  const SizedBox(height: 16),
                  Expanded(
                      child: ListView.builder(
                        itemCount: todoListModel.items.length,
                        itemBuilder: (context, index) {
                          var controller = todoListModel.controllers[todoListModel.items[index].key];
                          if (controller == null) {
                            throw Exception("找不到controller");
                          }
                          return TodoItemWidget(
                            task: todoListModel.items[index],
                            controller: controller,
                          );
                        },
                      ))
                ],
              )),

          Expanded(
              child: Container(
                  color: Colors.white,
                  child: WorkBodyWidget(controller: currentController)
              )
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    myFocusNode.dispose();
  }
}
