import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/services/models/task.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptyWidget extends StatefulWidget {
  final String message;
  const EmptyWidget({Key? key, this.message = ""}) : super(key: key);

  @override
  State<EmptyWidget> createState() => _EmptyWidget();
}

class _EmptyWidget extends State<EmptyWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Image(image: AssetImage('images/ui/empty.png')),
          Text(widget.message,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),)]
    ));
  }
}
