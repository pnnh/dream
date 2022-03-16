import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfxui/editor/models/node.dart';
import 'package:sfxui/editor/models/states.dart';
import 'package:sfxui/editor/nodes/text.dart';

import 'plus.dart';

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
          SFPlus(),
          SizedBox(
            width: 8,
          ),
          Expanded(
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
