import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SFEditorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('编辑器'),
      ),
      body: SFEditorBody(),
    );
  }
}

class SFEditorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: '开始输入',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                maxLines: null,
              )
            ],
          )),
    );
  }
}
