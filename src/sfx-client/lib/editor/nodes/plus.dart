import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfxui/editor/models/node.dart';
import 'package:sfxui/editor/models/states.dart';

class SFPlus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RowState>(
        builder: (context, state, child) => Container(
              height: 48,
              width: 96,
              child: state.show
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            iconSize: 24,
                            constraints:
                                BoxConstraints(maxHeight: 24, maxWidth: 24),
                            padding: EdgeInsets.zero,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onPressed: () {
                              var node = SFTextNode('content + ');
                              var editorState = context.read<SFEditorState>();
                              editorState.insertNode(state.index + 1, node);
                            },
                            icon: Icon(Icons.add)),
                        IconButton(
                            iconSize: 24,
                            constraints:
                                BoxConstraints(maxHeight: 24, maxWidth: 24),
                            padding: EdgeInsets.zero,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onPressed: () {},
                            icon: Icon(Icons.article)),
                        PopupMenuButton(
                            initialValue: '语文',
                            itemBuilder: (context) {
                              return <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: '语文',
                                  child: Column(
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('一号标题')),
                                      TextButton(
                                          onPressed: () {}, child: Text('二号标题'))
                                    ],
                                  ),
                                ),
                              ];
                            })
                      ],
                    )
                  : null,
            ));
  }
}
