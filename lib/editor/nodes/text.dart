import 'package:flutter/material.dart';

class SFText extends StatefulWidget {
  final String text;
  SFText({Key? key, required this.text}) : super(key: key);

  @override
  _SFText createState() => _SFText();
}

class _SFText extends State<SFText> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController()..text = widget.text;
    return TextField(
      decoration: InputDecoration(
        hintText: '开始输入',
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: myController,
    );
  }
}
