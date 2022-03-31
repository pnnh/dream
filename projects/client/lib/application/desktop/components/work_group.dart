import 'package:dream/application/desktop/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'avatar.dart';

class WorkGroupWidget extends StatefulWidget {
  const WorkGroupWidget({Key? key}) : super(key: key);

  @override
  State<WorkGroupWidget> createState() => _WorkGroupWidget();
}

class _WorkGroupWidget extends State<WorkGroupWidget> {
  int selectedIndex = 0;
  final Color selectedColor = const Color.fromRGBO(0, 119, 212, 100);
  final Color defaultColor = const Color.fromRGBO(146, 148, 152, 100);

  @override
  Widget build(BuildContext context) {
    var routerDelegate = BookRouterDelegate.of(context);
    return Column(children: [
      AvatarWidget(),
      const SizedBox(height: 24),
      IconButton(
          icon: SvgPicture.asset(
            "images/svg/todo.svg",
            color: selectedIndex == 0 ? selectedColor : defaultColor,
          ),
          iconSize: 24,
          onPressed: () {
            setState(() {
              selectedIndex = 0;
            });
            routerDelegate.handleBookTapped("");
          }),
      const SizedBox(height: 24),
      IconButton(
          icon: SvgPicture.asset(
            "images/svg/booklet.svg",
            color: selectedIndex == 1 ? selectedColor : defaultColor,
          ),
          iconSize: 24,
          onPressed: () {
            setState(() {
              selectedIndex = 1;
            });
            routerDelegate.handleBookTapped("detail");
          }),
      const SizedBox(height: 24),
      IconButton(
          icon: SvgPicture.asset(
            "images/svg/todo.svg",
            color: selectedIndex == 2 ? selectedColor : defaultColor,
          ),
          iconSize: 24,
          onPressed: () {
            setState(() {
              selectedIndex = 2;
            });
          }),
    ]);
  }
}
