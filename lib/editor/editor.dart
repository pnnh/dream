import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfxui/editor/models/node.dart';

import 'nodes/Text.dart';

class SFEditorRoute extends StatefulWidget {
  SFEditorRoute({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SFEditorRoute createState() => _SFEditorRoute();
}

class _SFEditorRoute extends State<SFEditorRoute> {
  String _text = 'xxx';
  List<SFNode> children = [SFNode()];
  int currentRow = 0;

  @override
  void initState() {
    super.initState();
    this._text = '呀哈哈';
  }

  List<Widget> buildChildren() {
    var result = List<Widget>.empty(growable: true);
    for (var i = 0; i < children.length; i++) {
      var colLeft = Column(
        children: [],
      );
      if (currentRow == i) {
        colLeft.children.insert(
            0,
            IconButton(
                onPressed: () {
                  print('pressed');
                  setState(() {
                    children.add(SFNode());
                  });
                },
                icon: Icon(Icons.add)));
      } else {
        colLeft.children.insert(
            0, IconButton(onPressed: () {}, icon: Icon(Icons.new_label)));
      }
      var row = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          colLeft,
          Expanded(
              child: MouseRegion(
            onEnter: (event) {
              print('onHover' + i.toString());
              setState(() {
                this.currentRow = i;
              });
            },
            child: Column(
              children: [SFText()],
            ),
          ))
        ],
      );
      result.add(row);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._text),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: buildChildren(),
            )),
      ),
    );
  }
}
