import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfxui/editor/models/node.dart';
import 'package:sfxui/editor/models/states.dart';

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
