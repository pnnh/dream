import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        width: 24,
        height: 24,
        child: SvgPicture.asset(
          "images/svg/booklet.svg",
          color: Color.fromRGBO(146, 148, 152, 100),
        ),
      ),
    );
  }
}
