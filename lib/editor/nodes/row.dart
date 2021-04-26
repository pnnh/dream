import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../nodes/Text.dart';

class SFRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () => {}, icon: Icon(Icons.add)),
        Expanded(child: SFText())
      ],
    );
  }
}
