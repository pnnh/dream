import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfxui/application/desktop/components/todo_item.dart';

import '../provider/todo_list.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  State<TodoListWidget> createState() => _TodoListWidget();
}

class _TodoListWidget extends State<TodoListWidget> {
  final List<TextEditingController> _controllers =
      List.generate(10, (i) => TextEditingController());
  int selectedIndex = 0;
  int hoveredIndex = 0;
  final Color selectedColor = const Color.fromRGBO(238, 243, 254, 100);
  final Color defaultColor = Colors.white;
  final Color iconColor = const Color.fromRGBO(153, 153, 153, 100);

  String content = "啊啊啊啊啊啊";
  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TodoListModel(),
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              var controller = _controllers[index];
              controller.text = items[index];
              return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: TodoItemWidget(
                    id: index,
                    controller: controller,
                  ));
            },
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    for (TextEditingController c in _controllers) {
      c.dispose();
    }
  }
}
