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
  List<SFNode> children = [SFNode('text')];
  int currentRow = 0;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> buildChildren() {
    var result = List<Widget>.empty(growable: true);
    for (var i = 0; i < children.length; i++) {
      var node = children[i];
      var colLeft = Expanded(
        flex: 1,
        child: Text(''),
      );
      if (currentRow == i) {
        colLeft = Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  print('pressed ' + i.toString());
                  setState(() {
                    children.insert(
                        i + 1,
                        SFNode('text',
                            content: 'content + ' + (i + 1).toString()));
                  });
                },
                icon: Icon(Icons.add)));
      }
      var row = MouseRegion(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              colLeft,
              Expanded(
                flex: 11,
                child: Column(
                  children: [SFText(text: node.content)],
                ),
              )
            ],
          ),
          onEnter: (event) {
            setState(() {
              this.currentRow = i;
            });
          });
      result.add(row);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: buildChildren(),
          )),
    );
  }
}
