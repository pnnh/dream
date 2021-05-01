import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfxui/editor/models/node.dart';
import 'package:sfxui/editor/nodes/text.dart';

class SFRow extends StatefulWidget {
  final SFNode node;
  final int index;
  SFRow(this.index, this.node, {Key? key}) : super(key: key);
  @override
  _SFRow createState() => _SFRow();
}

class _SFRow extends State<SFRow> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: show
                ? IconButton(
                    onPressed: () {
                      // print('pressed ' + i.toString());
                      // setState(() {
                      //   children.insert(
                      //       i + 1,
                      //       SFNode('text',
                      //           content: 'content + ' + (i + 1).toString()));
                      // });
                      var node = SFTextNode('content + ');
                      var state = context.read<SFEditorState>();
                      state.insertNode(widget.index + 1, node);
                    },
                    icon: Icon(Icons.add))
                : Text(''),
          ),
          Expanded(
            flex: 11,
            child: Column(
              children: [renderNode(widget.node)],
            ),
          )
        ],
      ),
      onEnter: (event) {
        setState(() {
          this.show = true;
        });
      },
      onExit: (event) {
        setState(() {
          this.show = false;
        });
      },
    );
  }
}

Widget renderNode(SFNode node) {
  switch (node.runtimeType) {
    case SFTextNode:
      return SFTextWidget(node, (text) => (node as SFTextNode).onChange(text));
  }
  return Text('未知节点');
}
