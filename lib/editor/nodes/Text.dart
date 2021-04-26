import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SFText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '开始输入',
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
      keyboardType: TextInputType.multiline,
      maxLines: null,
    );
  }
}
