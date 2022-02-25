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
