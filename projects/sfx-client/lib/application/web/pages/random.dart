import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RandomWidget extends StatefulWidget {
  const RandomWidget({Key? key}) : super(key: key);

  @override
  State<RandomWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<RandomWidget> {
  bool hasLetter = true;
  bool hasUppercaseLetter = true;
  bool hasNumber = true;
  bool hasSymbol = false;
  int length = 16;
  String password = "";

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [Text("随机密码生成器")],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [Text("本页生成的密码不会保持，刷新或关闭页面后消失")],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                hoverColor: Colors.transparent,
                splashRadius: 0,
                value: hasLetter,
                onChanged: (bool? value) {
                  setState(() {
                    hasLetter = value!;
                  });
                },
              ),
              Text(
                "小写字母",
                style: TextStyle(fontSize: 14, height: 1),
              ),
              SizedBox(
                width: 8,
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                hoverColor: Colors.transparent,
                splashRadius: 0,
                value: hasUppercaseLetter,
                onChanged: (bool? value) {
                  setState(() {
                    hasUppercaseLetter = value!;
                  });
                },
              ),
              Text(
                "大写字母",
                style: TextStyle(fontSize: 14, height: 1),
              ),
              SizedBox(
                width: 8,
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                hoverColor: Colors.transparent,
                splashRadius: 0,
                value: hasNumber,
                onChanged: (bool? value) {
                  setState(() {
                    hasNumber = value!;
                  });
                },
              ),
              Text(
                "数字",
                style: TextStyle(fontSize: 14, height: 1),
              ),
              SizedBox(
                width: 8,
              ),
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                hoverColor: Colors.transparent,
                splashRadius: 0,
                value: hasSymbol,
                onChanged: (bool? value) {
                  setState(() {
                    hasSymbol = value!;
                  });
                },
              ),
              Text(
                "特殊符号",
                style: TextStyle(fontSize: 14, height: 1),
              )
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 48,
              height: 32,
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal))),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LimitRangeTextInputFormatter(4, 64),
                ],
                controller: TextEditingController(text: length.toString()),
                onChanged: (text) {
                  setState(() {
                    length = int.parse(text);
                  });
                },
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: Size(100, 32)),
            onPressed: () {
              setState(() {
                password = "aaaaa";
              });

              print(js.context.callMethod("sayHello"));
            },
            child: Text(
              "生成密码",
              style: TextStyle(fontSize: 14, height: 1),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            password,
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = int.parse(newValue.text);
    if (value < min) {
      return TextEditingValue(text: min.toString());
    } else if (value > max) {
      return TextEditingValue(text: max.toString());
    }
    return newValue;
  }
}
