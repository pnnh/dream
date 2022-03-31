import 'package:dream/application/desktop/application.dart';
import 'package:dream/application/desktop/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'avatar.dart';

class WorkGroupWidget extends StatefulWidget {
  const WorkGroupWidget({Key? key}) : super(key: key);

  @override
  State<WorkGroupWidget> createState() => _WorkGroupWidget();
}

class _WorkGroupWidget extends State<WorkGroupWidget> {
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
            color: routerDelegate.currentPath.pathName == Pages.home
                ? selectedColor
                : defaultColor,
          ),
          iconSize: 24,
          onPressed: () {
            routerDelegate.handleBookTapped("home");
          }),
      const SizedBox(height: 24),
      IconButton(
          icon: SvgPicture.asset(
            "images/svg/booklet.svg",
            color: routerDelegate.currentPath.pathName == Pages.detail
                ? selectedColor
                : defaultColor,
          ),
          iconSize: 24,
          onPressed: () {
            routerDelegate.handleBookTapped("detail");
          }),
      const SizedBox(height: 24),
      IconButton(
          icon: SvgPicture.asset(
            "images/svg/todo.svg",
            color: routerDelegate.currentPath.pathName == Pages.other
                ? selectedColor
                : defaultColor,
          ),
          iconSize: 24,
          onPressed: () {}),
    ]);
  }
}
