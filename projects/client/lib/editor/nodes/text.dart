import 'package:flutter/material.dart';
import 'package:dream/editor/models/node.dart';

typedef OnTextChange = void Function(String text);

class SFTextWidget extends StatelessWidget {
  final SFNode node;
  final OnTextChange onChange;
  SFTextWidget(this.node, this.onChange);

  @override
  Widget build(BuildContext context) {
    var textNode = this.node as SFTextNode;
    final myController = TextEditingController()..text = textNode.content;
    myController.addListener(() {
      print('value change ' + myController.text);
      this.onChange(myController.text);
    });
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
