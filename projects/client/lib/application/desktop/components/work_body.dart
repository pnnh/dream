import 'package:dream/application/desktop/provider/todo.dart';
import 'package:dream/services/models/task.dart';
import 'package:dream/widgets/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WorkBodyWidget extends StatefulWidget {
  final Task task;
  final TextEditingController controller;

  const WorkBodyWidget(
      {Key? key, required Task this.task, required this.controller})
      : super(key: key);

  @override
  State<WorkBodyWidget> createState() => _WorkBodyWidget();
}

class _WorkBodyWidget extends State<WorkBodyWidget> {
  final Color selectedColor = const Color.fromRGBO(0, 119, 212, 100);
  final Color defaultColor = const Color.fromRGBO(146, 148, 152, 100);
  final bodyController = TextEditingController();
  bool showDatePicker = false;

  @override
  Widget build(BuildContext context) {
    final todoListModel = Provider.of<TodoProvider>(context);
    bodyController.text = widget.task.body;
    return Padding(
        padding: const EdgeInsets.all(16),
        child:

          Stack(
            children: [
          Column(children: [
              SizedBox(
                  height: 32,
                  child: Row(children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          "images/svg/calendar_2.svg",
                          color: const Color.fromRGBO(153, 153, 153, 100),
                        )),
                    const SizedBox(width: 8),
                    TextButton(
                      child: Text("设置提醒",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        overlayColor: MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          showDatePicker = !showDatePicker;
                        });
                      },
                    ),
                  ])),
              TextField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(4),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  hintText: "任务标题",
                ),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                controller: widget.controller,
                onChanged: (text) {
                  todoListModel.putItem(widget.task.key, text, widget.task.body);
                },
              ),
              const SizedBox(height: 24),
              Expanded(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(4),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      hintText: "任务正文",
                    ),
                    controller: bodyController,
                    onChanged: (text) {
                      print("WorkBodyWidget body update $text");
                      todoListModel.putItem(widget.task.key, widget.task.title, text);
                    },
                  ))
      ]),
            if (showDatePicker)
              Positioned(
                child: Container(
                     height: 200, width: 200,
                  decoration: BoxDecoration(color: Colors.white,
                      border: Border.all(
                          color: Color.fromRGBO(229, 229, 229, 100),
                          width: 1, ),
                    borderRadius: BorderRadius.all(const Radius.circular(4)),
                  ),
                  child: MyDatePickerApp(),
                ),
                left: 00,
                top: 40,
              )
            ],
          ),
        );
  }
}
