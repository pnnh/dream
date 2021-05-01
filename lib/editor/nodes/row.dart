import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfxui/editor/models/node.dart';
import 'package:sfxui/editor/models/states.dart';
import 'package:sfxui/editor/nodes/text.dart';

class SFPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RowState>(
      builder: (context, state, child) => Container(
        width: 48,
        height: 48,
        child: state.show
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
                  var editorState = context.read<SFEditorState>();
                  editorState.insertNode(state.index + 1, node);
                },
                icon: Icon(Icons.add))
            : Text(''),
      ),
    );
  }
}

class SFRowWidget extends StatelessWidget {
  final SFNode node;
  final int index;
  SFRowWidget(this.index, this.node, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RowState(index, false),
      child: SFRow(this.node),
    );
  }
}

class SFRow extends StatelessWidget {
  final SFNode node;
  SFRow(this.node, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: SFPlus()),
          Expanded(
            flex: 11,
            child: Column(
              children: [renderNode(this.node)],
            ),
          )
        ],
      ),
      onEnter: (event) {
        var state = context.read<RowState>();
        state.setShow(true);
      },
      onExit: (event) {
        var state = context.read<RowState>();
        state.setShow(false);
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
