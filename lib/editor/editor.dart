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
  @override
  void initState() {
    super.initState();
    this._text = '呀哈哈';
  }

  List<Widget> buildChildren() {
    var result = children
        .map((e) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      print('pressed');
                      setState(() {
                        children.add(SFNode());
                      });
                    },
                    icon: Icon(Icons.add)),
                Expanded(child: SFText())
              ],
            ))
        .toList();
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
