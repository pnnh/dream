import 'package:flutter/cupertino.dart';
import 'package:sfxui/editor/models/node.dart';
import 'package:sfxui/editor/nodes/Text.dart';

Widget render(SFNode node) {
  switch (node.type) {
    case 'text':
      return SFText();
  }
  return Text('');
}
