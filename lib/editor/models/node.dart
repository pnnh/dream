import 'package:flutter/cupertino.dart';

class SFNode {
  String type = 'text';

  SFNode(this.type);
}

class SFTextNode extends SFNode {
  String content;

  SFTextNode(this.content) : super('text');

  void onChange(String text) {
    print('onchange $text');
    this.content = text;
  }
}

class SFEditorState with ChangeNotifier {
  int value = 0;

  List<SFNode> children = [SFTextNode('我是一个文本节点')];

  void increment() {
    value += 1;
    notifyListeners();
  }

  void insertNode(int index, SFNode node) {
    this.children.insert(index, node);
    notifyListeners();
  }
}
