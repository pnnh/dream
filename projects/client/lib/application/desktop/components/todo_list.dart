import 'package:dream/application/desktop/components/todo_item.dart';
import 'package:dream/application/desktop/components/work_body.dart';
import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/application/desktop/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
    final todoListModel = Provider.of<TodoProvider>(context);
    var items = todoListModel.items.values.toList();
    print("TodoListWidget build ${items.length}");
    final currrentItem = todoListModel.currentItem;
    final homeProvider = Provider.of<HomeProvider>(context);

    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
              width: 360,
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(
                color: Color.fromRGBO(229, 229, 229, 100),
                width: 1,
              ))),
              child: Column(
                children: [
                  Row(children: [
                    IconButton(
                        icon: SvgPicture.asset(
                          homeProvider.showFilter
                              ? "images/svg/menu_unfold.svg"
                              : "images/svg/menu_fold.svg",
                          color: Color.fromRGBO(153, 153, 153, 100),
                        ),
                        iconSize: 24,
                        onPressed: () {
                          homeProvider.switchFilter();
                        }),
                    Text("收集箱",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ))
                  ]),
                  SizedBox(
                      height: 48,
                      child: TextField(
                        autofocus: true,
                        focusNode: myFocusNode,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 8, right: 8, top: 4, bottom: 4),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        keyboardType: TextInputType.number,
                        controller: contentController,
                        onSubmitted: (text) {
                          print("Go button is clicked $text");
                          todoListModel.addItem(text, "");
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
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      var item = items[index];
                      if (item == null || item.task == null) {
                        throw Exception("找不到item");
                      }
                      return TodoItemWidget(
                        task: item.task,
                        controller: item.controller,
                      );
                    },
                  ))
                ],
              )),
          Expanded(
              child: Container(
                  color: Colors.white,
                  child: currrentItem != null
                      ? WorkBodyWidget(
                          task: currrentItem.task,
                          controller: currrentItem.controller)
                      : const EmptyWidget(message: "点击左侧标题查看详情")))
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
