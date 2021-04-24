import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SFEditorRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: SFEditorBody(),
    );
  }
}

class SFEditorBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextField(),
            TextField(
              decoration: InputDecoration(
                hintText: '文章正文',
              ),
              maxLines: null,
              minLines: 5,
            )
          ],
        ));
  }
}
