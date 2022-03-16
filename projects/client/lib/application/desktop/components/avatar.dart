import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        width: 36,
        height: 36,
        child: Image(image: AssetImage('images/avatar.jpeg')),
      ),
    );
  }
}
