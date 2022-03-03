import 'package:flutter/material.dart';

class RandomWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            children: [
              SizedBox(
                width: 150,
                child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("大写字母"),
                    value: true,
                    onChanged: (isCheck) {}),
              )
            ],
          ),
        )
      ],
    );
  }
}

class RandomWidget extends StatefulWidget {
  const RandomWidget({Key? key}) : super(key: key);

  @override
  State<RandomWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<RandomWidget> {
  bool isChecked = false;

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
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              Text("大写字母")
            ],
          ),
        )
      ],
    );
  }
}
